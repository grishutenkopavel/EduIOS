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
        print(rect.maxX, rect.maxY)
        let context: CGContext? = UIGraphicsGetCurrentContext()
        let square1: CGRect = CGRect(x: 100, y: 100, width: 100, height: 100)
        let square2: CGRect = CGRect(x: 200, y: 200, width: 100, height: 100)
        let square3: CGRect = CGRect(x: 300, y: 300, width: 100, height: 100)
       
        
        context?.setStrokeColor(CGColor(red: 1, green: 0, blue: 0, alpha: 1))
        context?.addRect(square1)
        context?.addRect(square2)
        context?.addRect(square3)
        context?.strokePath()
    
        context?.setFillColor(CGColor(red: 0, green: 1, blue: 0, alpha: 1))
        context?.addEllipse(in: square1)
        context?.addEllipse(in: square2)
        context?.addEllipse(in: square3)
        context?.fillPath()
        
        context?.setStrokeColor(CGColor(red: 0, green: 0, blue: 1, alpha: 1))
        context?.setLineWidth(3.0)
        context?.move(to: CGPoint(x: 100, y: 100))
        context?.addLine(to: CGPoint(x: 200, y: 200))
        context?.strokePath()
        
        context?.move(to: CGPoint(x: square1.minX, y: square1.maxY))
        context?.addLine(to: CGPoint(x: square3.minX, y: square3.maxY))
        context?.move(to: CGPoint(x: square1.maxX, y: square1.minY))
        context?.addLine(to: CGPoint(x: square3.maxX, y: square3.minY))
        context?.strokePath()
        
        context?.setStrokeColor(CGColor(red: 0.32, green: 0.11, blue: 0.42, alpha: 1))
        context?.addArc(center: CGPoint(x: square2.minX, y: square2.minY),
                        radius: square2.height,
                        startAngle: .pi/2, endAngle: .pi,
                        clockwise: false)
        context?.strokePath()
        context?.addArc(center: CGPoint(x: square2.maxX, y: square2.maxY),
                        radius: square2.height,
                        startAngle: .pi * 3/2, endAngle: 0.0,
                        clockwise: false)
        context?.strokePath()
        
        let text: NSString = "test"
        let font: UIFont = UIFont.systemFont(ofSize: 14.0)
        let shadow: NSShadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 1, height: 1)
        shadow.shadowColor = UIColor.white
        shadow.shadowBlurRadius = 0.5
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.gray,
                          NSAttributedString.Key.font: font,
                          NSAttributedString.Key.shadow: shadow]
        let size = text.size(withAttributes: attributes)
        let textRect = CGRect(x: square2.midX - size.width/2,
                              y: square2.midY - size.height/2,
                              width: size.width, height: size.height)
        text.draw(in: textRect,
                  withAttributes: attributes)
        
        //chess board
        let offset = 50
        let borderWidth = 2.0
        let rectWidth = rect.width - CGFloat((offset + Int(borderWidth)) * 2)
        let rectHeight = rect.height - CGFloat((offset + Int(borderWidth)) * 2)
        let maxBoardSize: CGFloat = min(rectWidth, rectHeight)
        
        let cellSize = Int(maxBoardSize) / 8
        let boardSize = cellSize * 8
        let boardRect = CGRect(x: (Int(rect.width) - boardSize) / 2,
                               y: (Int(rect.height) - boardSize) / 2,
                               width: boardSize, height: boardSize).integral
        context?.setFillColor(UIColor.gray.cgColor)
        
        for i in 0..<8{
            let x = Int(boardRect.minX) + cellSize * i
            for j in 0..<8{
                let y = Int(boardRect.minY) + cellSize * j
                if i % 2 != j % 2 {
                        context?.fill(CGRect(x: x, y: y, width: cellSize, height: cellSize))
                }
            }
        }
        context?.setStrokeColor(UIColor.gray.cgColor)
        context?.stroke(boardRect)
    }
}
