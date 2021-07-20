//
//  PlayGround.swift
//  minesweeper
//
//  Created by Павел Гришутенко on 16.07.2021.
//

import UIKit

class PlayGround: UIView {

    func drawCell(point:CGPoint) -> CGRect{
        let cell = CGRect(x: point.x, y: point.y, width: self.frame.width / 20, height: self.frame.height / 20)
        return cell
    
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(CGColor(red: 0, green: 1, blue: 0, alpha: 1))
        context?.addRect(drawCell(point: CGPoint(x: self.frame.minX, y: self.frame.midY - self.frame.height / 10)))
        context?.fillPath()
    }

}
