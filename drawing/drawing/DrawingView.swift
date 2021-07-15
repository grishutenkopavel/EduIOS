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
    
        context?.setStrokeColor(CGColor(red: 0, green: 1, blue: 0, alpha: 1))
        context?.setLineWidth(3.0)
        context?.move(to: CGPoint(x: 100, y: 100))
        context?.addLine(to: CGPoint(x: 200, y: 200))
        
        
        context?.strokePath()
        
    }
}
