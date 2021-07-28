//
//  ViewController.swift
//  minesweeper
//
//  Created by Павел Гришутенко on 16.07.2021.
//

import UIKit

class ViewController: UIViewController {
    var game: PlayGround!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.game = PlayGround(frame: CGRect(x: 0, y: 0,
                                        width: self.view.frame.maxX,
                                        height: self.view.frame.maxY))
        self.game.sizeInPortraitMode = CGSize(width: min(self.view.frame.maxX, self.view.frame.maxY),
                                              height: max(self.view.frame.maxX, self.view.frame.maxY))
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(handleTapGesture(tapGesture:)))
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(longPressTapGesture:)))
        
        game.addGestureRecognizer(tapGesture)
        game.addGestureRecognizer(longPressGesture)
        self.view.addSubview(game)
    }
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        viewWillRotate()
        game.setNeedsDisplay()
    }
    func viewWillRotate(){
        if (UIDevice.current.orientation.isLandscape){
            game.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: game.sizeInPortraitMode.height, height: game.sizeInPortraitMode.width))
        }
        if (UIDevice.current.orientation.isPortrait){
            game.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: game.sizeInPortraitMode.width, height: game.sizeInPortraitMode.height))
        }
    }
    func translateWindowCoordToGame(sender: UIGestureRecognizer) -> CGPoint{
        let minBoardSize = min(game.bounds.width, game.bounds.height)
        let cellSize = minBoardSize / CGFloat(game.cntCell)
        let xPos =  Int((sender.location(in: game).x - (game.bounds.width - minBoardSize) / 2) / cellSize)
        
        let yPos = Int((sender.location(in: game).y - (game.bounds.height - minBoardSize) / 2) / cellSize)
        return CGPoint(x: xPos, y: yPos)
    }
    @objc func handleTapGesture(tapGesture: UITapGestureRecognizer){
        let cellCoord = translateWindowCoordToGame(sender: tapGesture)
        game.openCell(x: Int(cellCoord.x), y: Int(cellCoord.y))
    }
    @objc func handleLongPressGesture(longPressTapGesture: UILongPressGestureRecognizer){
        if longPressTapGesture.state == .began {
            let cellCoord = translateWindowCoordToGame(sender: longPressTapGesture)
            game.setFlag(x: Int(cellCoord.x), y: Int(cellCoord.y))
        }
    }
}

