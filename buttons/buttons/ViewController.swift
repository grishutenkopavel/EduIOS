//
//  ViewController.swift
//  buttons
//
//  Created by Павел Гришутенко on 20.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        button.setTitle("button", for: UIControl.State.normal)
        button.backgroundColor = UIColor.gray
        button.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        button.setTitleColor(UIColor.green, for: UIControl.State.highlighted)
        
//        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)]
//        let title = NSAttributedString(string: "Button", attributes: attributes)
//        button.setAttributedTitle(title, for: UIControl.State.normal)
        
        button.addTarget(self, action: #selector(actionClickButton(button:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
    }
    @objc func actionClickButton(button: UIButton){
        print("hello")
    }

}

