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
        game.addGestureRecognizer(tapGesture)
        
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
    @objc func handleTapGesture(tapGesture: UITapGestureRecognizer){
        print(tapGesture.location(in: game))
    }
}

