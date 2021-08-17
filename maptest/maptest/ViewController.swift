//
//  ViewController.swift
//  maptest
//
//  Created by Павел Гришутенко on 17.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forwardBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func goOnMapView(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mapView = storyboard.instantiateViewController(identifier: "MapViewController") as! MapViewController
        show(mapView, sender: self)
    }
}

