//
//  Texturable.swift
//  GameMetal
//
//  Created by Павел Гришутенко on 05.12.2021.
//

import MetalKit

protocol Texturable {
  var texture: MTLTexture? { get set }
}

extension Texturable {
  func setTexture(device: MTLDevice?, imageName: String) -> MTLTexture? {
    guard let device = device else { return nil }
    var texture: MTLTexture? = nil
    let textureLoader = MTKTextureLoader(device: device)
    let textureURL = Bundle.main.url(forResource: imageName, withExtension: nil)
    do {
      texture = try textureLoader.newTexture(URL: textureURL!, options: [MTKTextureLoader.Option.origin : MTKTextureLoader.Origin.bottomLeft])
    } catch {
      print("texture not created")
    }
    return texture
  }
}
