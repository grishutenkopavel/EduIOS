//
//  ViewController.swift
//  Hello, Triangle!
//
//  Created by Павел Гришутенко on 12.09.2021.
//
import Metal
import QuartzCore
import UIKit

class ViewController: UIViewController {

    var device: MTLDevice! = nil
    var metalLayer: CAMetalLayer
    override func viewDidLoad() {
        super.viewDidLoad()
        
        device = MTLCreateSystemDefaultDevice()
        
        
    }


}

