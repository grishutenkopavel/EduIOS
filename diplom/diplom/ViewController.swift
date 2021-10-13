//
//  ViewController.swift
//  diplom
//
//  Created by Павел Гришутенко on 23.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        let increaseButton = UIButton(type: .custom)
        increaseButton.frame = CGRect(x: self.view.frame.maxX - 70, y: 220, width: 50, height: 50)
        increaseButton.layer.cornerRadius = 0.5 * increaseButton.bounds.size.width
        increaseButton.clipsToBounds = true
        increaseButton.setImage(UIImage(named:"increaseButton.png"), for: .normal)
        increaseButton.addTarget(self, action: #selector(increaseMap(sender:)), for: .touchDown)
        self.view.addSubview(increaseButton)
        
        let reduceButton = UIButton(type: .custom)
        reduceButton.frame = CGRect(x: self.view.frame.maxX - 70, y: 290, width: 50, height: 50)
        reduceButton.layer.cornerRadius = 0.5 * reduceButton.bounds.size.width
        reduceButton.clipsToBounds = true
        reduceButton.setImage(UIImage(named:"reduceButton.png"), for: .normal)
        reduceButton.addTarget(self, action: #selector(reduceMap(sender:)), for: .touchDown)
        self.view.addSubview(reduceButton)
        
        let searchView = SearchView(frame: CGRect(x: view.frame.minX, y: view.frame.midY+325,
                                           width: view.frame.maxX, height: view.frame.midY+100))
        searchView.backgroundColor = .white
        view.addSubview(searchView)
    }
    @objc func increaseMap(sender: UIButton) {
        print("increase")
    }
    @objc func reduceMap(sender: UIButton) {
        print("reduce")
    }
}

