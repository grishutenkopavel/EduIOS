//
//  ViewController.swift
//  DropDownMenu
//
//  Created by Павел Гришутенко on 01.09.2021.
//

import UIKit

class ViewController: UIViewController {
    var dropDownMenuView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dropDownMenuView = UIView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.maxY - 100,
                                                     width: self.view.frame.maxX, height: 100))
        dropDownMenuView.backgroundColor = .cyan
        self.view.addSubview(dropDownMenuView)
        let swipeDropDownMenuGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDropDownMenuGestureHandler(sender:)))
        swipeDropDownMenuGestureRecognizer.direction = .up
        dropDownMenuView.addGestureRecognizer(swipeDropDownMenuGestureRecognizer)
    }

    @objc func swipeDropDownMenuGestureHandler(sender: UIGestureRecognizer) {
        //if sender.state == .began {
            print(sender.location(in: self.view))
        //}
        if sender.state == .ended {
            
            self.dropDownMenuView.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.maxY - 400,
                                                 width: self.view.frame.maxX, height: 400)
//            (forAlignmentRect: CGRect(x: self.view.frame.minX,
//                                                                 y: self.view.frame.maxY - 300,
//                                                                 width: self.view.frame.maxX, height: 300))
        }
    }
}

