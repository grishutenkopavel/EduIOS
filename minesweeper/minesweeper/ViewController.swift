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
        game = PlayGround(frame: CGRect(x: 0, y: 0,
                                        width: self.view.bounds.maxX,
                                        height: self.view.bounds.maxY))

        self.view.addSubview(game)
    }
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        game.bounds = CGRect(x: 0, y: 0,
                             width: self.view.bounds.height,
                             height: self.view.bounds.width)
        game.setNeedsDisplay()
        print("op")
        
    }

}

