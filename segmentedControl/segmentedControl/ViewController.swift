//
//  ViewController.swift
//  segmentedControl
//
//  Created by Павел Гришутенко on 25.12.2021.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var cardImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


  @IBAction func suitDidChange(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      cardImageView.image = UIImage(named: "KS")
    case 1:
      cardImageView.image = UIImage(named: "KH")
    case 2:
      cardImageView.image = UIImage(named: "KC")
    case 3:
      cardImageView.image = UIImage(named: "KD")
    default:
      cardImageView.image = UIImage(named: "red_back")
    }
  }
  
}

