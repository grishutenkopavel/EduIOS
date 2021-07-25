//
//  PlayGround.swift
//  minesweeper
//
//  Created by Павел Гришутенко on 16.07.2021.
//

import UIKit

class PlayGround: UIView {
    var sizeInPortraitMode: CGSize!
    let cntCell = 10
    var map: [[FieldCell]]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createMap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createMap(){
        var minesCount = 20
        self.map  = Array(repeating: Array(repeating: FieldCell(), count: cntCell), count: cntCell)
        while minesCount > 0 {
            let i = Int(arc4random()) % cntCell
            let j = Int(arc4random()) % cntCell
            if(!map[i][j].isMine){
                map[i][j].isMine = true
                //add соседей
                minesCount -= 1
            }
        }
    }
    func drawVoidCell(mapI: Int, mapJ: Int, cellSize: Int, context: CGContext?){
        
        context?.setFillColor(CGColor(red: 0.7, green: 0.3, blue: 0.4, alpha: 1))
        context?.setStrokeColor(CGColor(red: 0, green: 1, blue: 0, alpha: 1))
        
        context?.stroke(CGRect(origin: map[mapI][mapJ].point,
                               size: CGSize(width: cellSize, height: cellSize)))
        context?.fill(CGRect(origin: map[mapI][mapJ].point,
                             size: CGSize(width: cellSize, height: cellSize)))
    }
    func drawMine(mapI: Int, mapJ: Int, cellSize: Int, context: CGContext?){
        context?.setFillColor(CGColor(red: 0, green: 0, blue: 0, alpha: 1))
        let mineSize = Int(cellSize / 2)
        context?.fill(CGRect(x: Int(map[mapI][mapJ].point.x) + mineSize / 2,
                             y: Int(map[mapI][mapJ].point.y) + mineSize / 2,
                             width: mineSize, height: mineSize))
    }
    
    func drawMap(){
        let context = UIGraphicsGetCurrentContext()
        
        let minBoardSize = min(self.bounds.width, self.bounds.height)
        
        let cellSize = Int(minBoardSize) / cntCell
        let fieldSize = cellSize * cntCell
        
        
        
        for i in 0..<cntCell{
            for j in 0..<cntCell{
                map[i][j].point = CGPoint(x: (Int(self.bounds.width) - fieldSize) / 2 + cellSize * j,
                                          y: (Int(self.bounds.height) - fieldSize) / 2 + cellSize * i)
                drawVoidCell(mapI: i, mapJ: j, cellSize: cellSize, context: context)
                if map[i][j].isOpen {
                    if map[i][j].isMine {
                        drawMine(mapI: i, mapJ: j, cellSize: cellSize, context: context)
                    }
                    if map[i][j].countOfMinesAround > 0 {
                        //drawCountOfMinesAround()
                    }
                }
            }
        }
    }
    override func draw(_ rect: CGRect) {
        drawMap()
        
    }
}
