//
//  MapViewController.swift
//  maptest
//
//  Created by Павел Гришутенко on 17.08.2021.
//

import Foundation
import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dialogheigth:CGFloat = self.view.frame.height * 0.5;
        let dialogwidth:CGFloat = self.view.frame.width * 0.5;
        self.preferredContentSize = CGSize(width: dialogwidth, height: dialogheigth)
    }
    
}
