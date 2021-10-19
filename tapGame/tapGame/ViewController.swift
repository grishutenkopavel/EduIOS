//
//  ViewController.swift
//  tapGame
//
//  Created by Павел Гришутенко on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var gameFieldView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gameFieldView.layer.borderWidth = 1
        gameFieldView.layer.borderColor = UIColor.gray.cgColor
        gameFieldView.layer.cornerRadius = 5
    }

    @IBAction func stepperChanged(_ sender: UIStepper) {
        timeLabel.text = "Время: \(sender.value) сек"
    }
    
}

