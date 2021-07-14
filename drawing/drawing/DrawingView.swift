//
//  DrawingView.swift
//  drawing
//
//  Created by Павел Гришутенко on 14.07.2021.
//

import Foundation
import UIKit

class DrawingView : UIView {
    override func draw(_ rect: CGRect) {
        let context: CGContext? = UIGraphicsGetCurrentContext()
        let square: CGRect = CGRect(x: 100, y: 200, width: 100, height: 100)
        
        context?.setFillColor(CGColor(red: 1, green: 0, blue: 0, alpha: 1))
        context?.addRect(square)
        
        context?.fillPath()
    }
}
