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
    let mines = 20
    var map: [[FieldCell]]!
    private var loseGame: Bool!
    private var closedCell: Int!
    override init(frame: CGRect) {
        super.init(frame: frame)
        createMap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createMap(){
        self.loseGame = false
        var minesCount = mines
        closedCell = cntCell * cntCell
        self.map  = Array(repeating: Array(repeating: FieldCell(), count: cntCell), count: cntCell)
        while minesCount > 0 {
            let i = Int(arc4random()) % cntCell
            let j = Int(arc4random()) % cntCell
            if(!map[i][j].isMine){
                map[i][j].isMine = true
                for di in -1...1 {
                    for dj in -1...1{
                        if i+di < cntCell && i+di >= 0  && j+dj < cntCell && j+dj >= 0{
                            map[i+di][j+dj].countOfMinesAround += 1
                        }
                    }
                }
                minesCount -= 1
            }
        }
    }
    func showAllMap(){
        for i in 0..<cntCell{
            for j in 0..<cntCell{
                map[i][j].isOpen = true
            }
        }
    }
    func openCell(x: Int, y: Int){
        if self.loseGame {
            createMap()
        }
        if x >= 0 && x < cntCell && y >= 0 && y < cntCell{
            if !map[y][x].isFlag && !map[y][x].isOpen{
                map[y][x].isOpen = true
                closedCell = closedCell! - 1
                if map[y][x].countOfMinesAround == 0 {
                    for i in -1...1{
                        for j in -1...1{
                            if i != 0 || j != 0{
                                openCell(x: x+j, y: y+i)
                            }
                        }
                    }
                }
                if map[y][x].isMine {
                    self.loseGame = true
                    showAllMap()
                }
                if closedCell! == mines {
                    print("You won")
                    createMap()
                }
                setNeedsDisplay()
            }
            
        }
    }
    func drawVoidOpenCell(mapI: Int, mapJ: Int, cellSize: Int, context: CGContext?){
        
        context?.setFillColor(CGColor(red: 0.7, green: 0.3, blue: 0.4, alpha: 1))
        context?.setStrokeColor(CGColor(red: 0, green: 1, blue: 0, alpha: 1))
        context?.setLineWidth(2)
        context?.stroke(CGRect(origin: map[mapI][mapJ].point,
                               size: CGSize(width: cellSize, height: cellSize)))
        context?.fill(CGRect(origin: map[mapI][mapJ].point,
                             size: CGSize(width: cellSize, height: cellSize)))
    }
    func drawVoidCloseCell(mapI: Int, mapJ: Int, cellSize: Int, context: CGContext?){
        
        context?.setFillColor(CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1))
        context?.setStrokeColor(CGColor(red: 0, green: 1, blue: 0, alpha: 1))
        context?.setLineWidth(2)
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
    func drawCountOfMinesAround(mapI: Int, mapJ: Int, minesAround a: Int,cellSize: Int, context: CGContext?){
        context?.setStrokeColor(CGColor(red: 1, green: 1, blue: 0, alpha: 1))
        context?.setLineWidth(4)
        let offset = Int(Double(cellSize) * 0.1)
        let segmentLength = Int(Double(cellSize) * 0.35)

        if a != 5 && a != 6 {
            context?.move(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + cellSize - offset,
                                      y: Int(map[mapI][mapJ].point.y) + offset))
            context?.addLine(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + cellSize - offset,
                                         y: Int(map[mapI][mapJ].point.y) + offset + segmentLength))
        }
        if a != 2 {
            context?.move(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + cellSize - offset,
                                      y: Int(map[mapI][mapJ].point.y) + 2 * offset + segmentLength))
            context?.addLine(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + cellSize - offset,
                                         y: Int(map[mapI][mapJ].point.y) + 2 * offset + 2 * segmentLength))
        }
        if a != 1 && a != 4 {
            context?.move(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + offset + segmentLength,
                                      y: Int(map[mapI][mapJ].point.y) + offset))
            context?.addLine(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + cellSize - offset,
                                         y: Int(map[mapI][mapJ].point.y) + offset))
        }
        if a != 1 && a != 7 {
            context?.move(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + offset + segmentLength,
                                      y: Int(map[mapI][mapJ].point.y) + offset + segmentLength))
            context?.addLine(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + cellSize - offset,
                                         y: Int(map[mapI][mapJ].point.y) + offset + segmentLength))
        }
        if a != 1 && a != 4 && a != 7{
            context?.move(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + offset + segmentLength,
                                      y: Int(map[mapI][mapJ].point.y) + cellSize - offset))
            context?.addLine(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + cellSize - offset,
                                         y: Int(map[mapI][mapJ].point.y) + cellSize - offset))
        }
        if a != 1 && a != 2 && a != 3 && a != 7 {
            context?.move(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + offset + segmentLength,
                                      y: Int(map[mapI][mapJ].point.y) + offset))
            context?.addLine(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + offset + segmentLength,
                                         y: Int(map[mapI][mapJ].point.y) + offset + segmentLength))
        }
        if a == 2 || a == 6 || a == 8 {
            context?.move(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + offset + segmentLength,
                                      y: Int(map[mapI][mapJ].point.y) + 2 * offset + segmentLength))
            context?.addLine(to: CGPoint(x: Int(map[mapI][mapJ].point.x) + offset + segmentLength,
                                         y: Int(map[mapI][mapJ].point.y) + 2 * offset + 2 * segmentLength))
        }
        context?.strokePath()
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
                if map[i][j].isOpen {
                    drawVoidOpenCell(mapI: i, mapJ: j, cellSize: cellSize, context: context)
                    if map[i][j].isMine {
                        drawMine(mapI: i, mapJ: j, cellSize: cellSize, context: context)
                    }
                    if map[i][j].countOfMinesAround > 0 && !map[i][j].isMine {
                        drawCountOfMinesAround(mapI: i, mapJ: j,
                                               minesAround: map[i][j].countOfMinesAround,
                                               cellSize: cellSize, context: context)
                    }
                } else {
                    drawVoidCloseCell(mapI: i, mapJ: j, cellSize: cellSize, context: context)
                }
            }
        }
    }
    override func draw(_ rect: CGRect) {
        drawMap()
        
    }
}
