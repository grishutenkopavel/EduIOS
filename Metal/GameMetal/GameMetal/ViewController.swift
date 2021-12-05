//
//  ViewController.swift
//  GameMetal
//
//  Created by Павел Гришутенко on 04.12.2021.
//

import UIKit
import MetalKit

struct Constants {
  var animatedBy: Float = 0.0
}

enum Colors {
  static let green = MTLClearColor(red: 0.0, green: 0.4, blue: 0.21, alpha: 1.0)
}

class ViewController: UIViewController {
  var vertices: [Vertex] = [
    Vertex(position: SIMD3<Float>(-1, 1, 0), color: SIMD4<Float>(1, 0, 0, 1), texture: SIMD2<Float>(0, 1)),
    Vertex(position: SIMD3<Float>(-1, -1, 0), color: SIMD4<Float>(0, 1, 0, 1), texture: SIMD2<Float>(0, 0)),
    Vertex(position: SIMD3<Float>(1, -1, 0), color: SIMD4<Float>(0, 0, 1, 1), texture: SIMD2<Float>(1, 0)),
    Vertex(position: SIMD3<Float>(1, 1, 0), color: SIMD4<Float>(1, 0, 1, 1), texture: SIMD2<Float>(1, 1))
  ]
  var indices: [UInt16] = [
    0, 1, 2,
    2, 3, 0
  ]
  
  var metalView: MTKView {
    return view as! MTKView
  }
  
  var device: MTLDevice?
  var commandQueue: MTLCommandQueue?
  var piplineState: MTLRenderPipelineState?
  var vertexBuffer: MTLBuffer?
  var indicesBuffer: MTLBuffer?
  var time: Float = 0.0
  var constants = Constants()
  var texture: MTLTexture?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    metalView.device = MTLCreateSystemDefaultDevice()
    device = metalView.device
    metalView.clearColor = Colors.green
    metalView.delegate = self
    commandQueue = device?.makeCommandQueue()
    texture = setTexture(device: device, imageName: "cube.png")
    buildModel()
    buildPipelineState()
  }

  private func buildModel() {
    vertexBuffer = device?.makeBuffer(bytes: vertices, length: vertices.count * MemoryLayout<Vertex>.stride, options: [])
    indicesBuffer = device?.makeBuffer(bytes: indices, length: indices.count * MemoryLayout<UInt16>.size, options: [])
  }
  
  private func buildPipelineState() {
    let library = device?.makeDefaultLibrary()
    let vertexShader = library?.makeFunction(name: "vertex_shader")
    //var fragmentShader = library?.makeFunction(name: "fragment_shader")
    //if texture != nil {
    let fragmentShader = library?.makeFunction(name: "textured_fragment")
    //}
    
    
    let pipelineDescriptor = MTLRenderPipelineDescriptor()
    pipelineDescriptor.vertexFunction = vertexShader
    pipelineDescriptor.fragmentFunction = fragmentShader
    pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
    
    let vertexDescriptor = MTLVertexDescriptor()
    vertexDescriptor.attributes[0].format = .float3
    vertexDescriptor.attributes[0].offset = 0
    vertexDescriptor.attributes[0].bufferIndex = 0
    vertexDescriptor.attributes[1].format = .float4
    vertexDescriptor.attributes[1].offset = MemoryLayout<SIMD3<Float>>.stride
    vertexDescriptor.attributes[1].bufferIndex = 0
    vertexDescriptor.attributes[2].format = .float2
    vertexDescriptor.attributes[2].offset = MemoryLayout<SIMD3<Float>>.stride + MemoryLayout<SIMD4<Float>>.stride
    vertexDescriptor.attributes[2].bufferIndex = 0
    
    vertexDescriptor.layouts[0].stride = MemoryLayout<Vertex>.stride
    pipelineDescriptor.vertexDescriptor = vertexDescriptor
    
    do {
      piplineState = try device?.makeRenderPipelineState(descriptor: pipelineDescriptor)
    } catch let error as NSError {
      print("error: \(error.localizedDescription)")
    }
  }
}

extension ViewController: MTKViewDelegate {
  func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}
  
  func draw(in view: MTKView) {
    guard let drawable = view.currentDrawable,
          let pipelindeState = piplineState,
          let indicesBuffer = indicesBuffer,
          let passDescriptor = view.currentRenderPassDescriptor
    else { return }
    
    let commandBuffer = commandQueue?.makeCommandBuffer()
    
    time += 1 / Float(view.preferredFramesPerSecond)
    let animateBy = abs(sin(time)/2 + 0.5)
    constants.animatedBy = animateBy
    
    let commandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: passDescriptor)
    
    commandEncoder?.setRenderPipelineState(pipelindeState)
    commandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
    commandEncoder?.setVertexBytes(&constants, length: MemoryLayout<Constants>.stride, index: 1)
    commandEncoder?.setFragmentTexture(texture, index: 0)
    commandEncoder?.drawIndexedPrimitives(type: .triangle, indexCount: indices.count, indexType: .uint16, indexBuffer: indicesBuffer, indexBufferOffset: 0)
    
    commandEncoder?.endEncoding()
    commandBuffer?.present(drawable)
    commandBuffer?.commit()
  }
  
}

extension ViewController: Texturable {
  
}
