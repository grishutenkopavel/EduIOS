//
//  PlayGround.swift
//  minesweeper
//
//  Created by Павел Гришутенко on 16.07.2021.
//

import UIKit

class PlayGround: UIView {
    let cntCell = 10
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let maxBoardSize = min(self.bounds.width, self.bounds.height)
        print("\(maxBoardSize)")
        let cellSize = Int(maxBoardSize) / cntCell
        let fieldSize = cellSize * cntCell
        let fieldRect = CGRect(x: (Int(self.bounds.width) - fieldSize) / 2,
                               y: (Int(self.bounds.height) - fieldSize) / 2,
                               width: fieldSize, height: fieldSize)
        //fieldRect = fieldRect.integral
        
        context?.setFillColor(CGColor(red: 1, green: 1, blue: 0, alpha: 1))
        context?.addRect(fieldRect)
        context?.fillPath()
    }

}
