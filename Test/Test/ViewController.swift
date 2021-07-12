//
//  ViewController.swift
//  Test
//
//  Created by Павел Гришутенко on 08.07.2021.
//

import UIKit

class ViewController:  UIViewController {
    
    var testView: UIView?
    var draggingView:  UIView?
    var touchPoint: CGPoint?
    
    func myFunc(lam: (Int) -> Void, value:Int){
        lam(value);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.testView = UIView(frame: CGRect(x: 200 , y: 200, width: 100, height: 100 ))
        self.testView!.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        self.view.addSubview(self.testView!)
        
//        UIView.animate(withDuration: 5) {
//            view.center = CGPoint(x: 250, y: self.view.bounds.height-view.frame.height/2)
//        }
        UIView.animate(withDuration: 5, delay: 2,
                       options: []) {
            self.testView!.center = CGPoint(x: 250, y: self.view.bounds.height-self.testView!.frame.height/2)
            self.testView!.transform = CGAffineTransform(rotationAngle: .pi / 2)
            self.testView!.transform = self.testView!.transform.concatenating(CGAffineTransform(rotationAngle: .pi / 2))
        } completion: { status in
            self.myFunc(lam: { hol in
                print(hol) 
            }, value: 10)
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let pointOnMainView: CGPoint = touch.location(in: self.view)
        let view:UIView = self.view.hitTest(pointOnMainView, with: event)!
        if (view === self.testView){
            self.draggingView = view
        } else {
            self.draggingView = nil
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.draggingView != nil{
            let touch: UITouch = touches.first!
            let pointOnMainView: CGPoint = touch.location(in: self.view)
            self.draggingView?.center = pointOnMainView
        }
    }

}

