//
//  ViewController.swift
//  testGestures
//
//  Created by Павел Гришутенко on 12.07.2021.
//

import UIKit

class ViewController: UIViewController {
    var testView: UIView!
    var testViewScale: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.testView = UIView(frame: CGRect(x: self.view.bounds.midX - 50,
                                        y: self.view.bounds.midY - 50,
                                        width: 100, height: 100 ))
        self.testView.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin,
                                     UIView.AutoresizingMask.flexibleRightMargin,
                                     UIView.AutoresizingMask.flexibleBottomMargin,
                                     UIView.AutoresizingMask.flexibleTopMargin]
        self.testView.backgroundColor = UIColor.green
        self.view.addSubview(self.testView)
        
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(tapGesture:)))
        
        //tapGesture.numberOfTapsRequired = 2;
        self.view.addGestureRecognizer(tapGesture)
        let doubleTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapGesture(doubleTapGesture:)))
        doubleTapGesture.numberOfTapsRequired = 2
        tapGesture.require(toFail: doubleTapGesture)
        self.view.addGestureRecognizer(doubleTapGesture)
        
        let pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(pinchGesture:)))
        
        self.view.addGestureRecognizer(pinchGesture)
        
    }
    
    func randomColor() -> UIColor {
        let r: CGFloat  = CGFloat(arc4random() % 256) / 255.0
        let g: CGFloat  = CGFloat(arc4random() % 256) / 255.0
        let b: CGFloat  = CGFloat(arc4random() % 256) / 255.0
    
        return UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
    }

    @objc func handleTapGesture(tapGesture: UITapGestureRecognizer){
        print("tap  \(tapGesture.location(in: self.view)) \n")
        
        self.testView.backgroundColor = randomColor() 
    }
    
    @objc func handleDoubleTapGesture(doubleTapGesture: UITapGestureRecognizer){
        print("double tap  \(doubleTapGesture.location(in: self.view)) \n")
        let currentTransform: CGAffineTransform = self.testView.transform
        let newTransform: CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(arc4random()%10))
        self.testView.transform = currentTransform.concatenating(newTransform)
    }
    @objc func handlePinchGesture(pinchGesture: UIPinchGestureRecognizer){
        print("handle pinch \(arc4random()%256)")
        
        if(pinchGesture.state == UIPinchGestureRecognizer.State.began){
            self.testViewScale = 1.0
        }

        let newScale = 1.0 + pinchGesture.scale - self.testViewScale
        let currentTransform: CGAffineTransform = self.testView.transform
        let newTransform: CGAffineTransform = CGAffineTransform(scaleX: newScale,
                                                                y: newScale)
        
        self.testView.transform = currentTransform.concatenating(newTransform)
        self.testViewScale = pinchGesture.scale
    }
}

