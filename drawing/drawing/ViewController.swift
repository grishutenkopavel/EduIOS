//
//  ViewController.swift
//  drawing
//
//  Created by Павел Гришутенко on 14.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawingView: DrawingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func orientationChanged() {

        // Consider using UIScreen.mainScreen().bounds.width and height in CGRect
        if(UIDevice.current.orientation.isLandscape)
        {
            print("landscape")
            self.drawingView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 896, height: 414))
        }

        if(UIDevice.current.orientation.isPortrait)
        {
            print("Portrait")
            self.drawingView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 414, height: 896))
        }

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        orientationChanged()
        self.drawingView.setNeedsDisplay()
    }
}
