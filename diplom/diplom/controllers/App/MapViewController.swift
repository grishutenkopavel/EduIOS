//
//  ViewController.swift
//  diplom
//
//  Created by Павел Гришутенко on 23.09.2021.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        createProfileButton()
        createIncreaseAndReduceButton()
        createSearchView()
    }
    
    func createProfileButton() {
        
        let buttonSize = 50.0
        let topOffset = 50.0
        let leftOffset = 20.0

        let profileButton = UIButton()
        profileButton.setImage(UIImage(named:"profile.png"), for: .normal)
        self.view.addSubview(profileButton)
        
        //MARK: Constraints
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        let verticalLayoutConstraint = NSLayoutConstraint(item: profileButton,
                                                     attribute: .top,
                                                    relatedBy: .equal,
                                                     toItem: view,
                                                     attribute: .top,
                                                     multiplier: 1, constant: topOffset)
        let horizontalLayoutConstraint = NSLayoutConstraint(item: profileButton,
                                                     attribute: .left,
                                                     relatedBy: .equal,
                                                     toItem: view,
                                                     attribute: .left,
                                                     multiplier: 3, constant: leftOffset)
        let widthConstraint = NSLayoutConstraint(item: profileButton,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1,
                                                            constant: buttonSize)
        let heightConstraint = NSLayoutConstraint(item: profileButton,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: buttonSize)
        self.view.addConstraints([verticalLayoutConstraint, horizontalLayoutConstraint,
                                 widthConstraint, heightConstraint])

    }
    
    func createIncreaseAndReduceButton() {
        let buttonSize = 50.0
        let rightOffset = 70.0
        let midXOffsetForIncreaseBtn = 1.5 * CGFloat(buttonSize)
        
        let increaseButton = UIButton(type: .custom)
        
        increaseButton.layer.cornerRadius = 0.5 * increaseButton.bounds.size.width
        increaseButton.clipsToBounds = true
        increaseButton.setImage(UIImage(named:"increaseButton.png"), for: .normal)
        increaseButton.addTarget(self, action: #selector(increaseMap(sender:)), for: .touchDown)
        self.view.addSubview(increaseButton)
        
        let topOffsetFromIncreaseBtn = 20.0
        let reduceButton = UIButton(type: .custom)
        reduceButton.layer.cornerRadius = 0.5 * reduceButton.bounds.size.width
        reduceButton.clipsToBounds = true
        reduceButton.setImage(UIImage(named:"reduceButton.png"), for: .normal)
        reduceButton.addTarget(self, action: #selector(reduceMap(sender:)), for: .touchDown)
        self.view.addSubview(reduceButton)
        
        //MARK: Constraints
        increaseButton.translatesAutoresizingMaskIntoConstraints = false
        reduceButton.translatesAutoresizingMaskIntoConstraints = false
        let verticalIncreaseBtnConstraint  = NSLayoutConstraint(item: increaseButton,
                                                                attribute: .bottom,
                                                                relatedBy: .equal,
                                                                toItem: view,
                                                                attribute: .centerY,
                                                                multiplier: CGFloat(1),
                                                                constant: -midXOffsetForIncreaseBtn)
        let verticalReduceBtnConstraint = NSLayoutConstraint(item: reduceButton,
                                                             attribute: .top,
                                                             relatedBy: .equal,
                                                             toItem: increaseButton,
                                                             attribute: .bottom,
                                                             multiplier: CGFloat(1),
                                                             constant: topOffsetFromIncreaseBtn)
        
        let horizontalIncreaseBtnConstraint = NSLayoutConstraint(item: increaseButton,
                                                                 attribute: .left,
                                                                 relatedBy: .equal,
                                                                 toItem: view,
                                                                 attribute: .right,
                                                                 multiplier: CGFloat(1), constant: CGFloat(-rightOffset))
        let horizontalReduceBtnConstraint = NSLayoutConstraint(item: reduceButton,
                                                               attribute: .left,
                                                               relatedBy: .equal,
                                                               toItem: view,
                                                               attribute: .right,
                                                               multiplier: CGFloat(1), constant: CGFloat(-rightOffset))
        
        let widthIncreaseBtnConstraint = NSLayoutConstraint(item: increaseButton,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1,
                                                            constant: buttonSize)
        let widthReduceBtnConstraint = NSLayoutConstraint(item: reduceButton,
                                                          attribute: .width,
                                                          relatedBy: .equal,
                                                          toItem: nil,
                                                          attribute: .notAnAttribute,
                                                          multiplier: 1,
                                                          constant: buttonSize)
        
        let heightIncreaseBtnConstraint = NSLayoutConstraint(
                                            item: increaseButton,
                                            attribute: .height, relatedBy: .equal,
                                            toItem: nil, attribute: .notAnAttribute,
                                            multiplier: 1, constant: buttonSize)
        let heightReduceBtnConstraint = NSLayoutConstraint(
                                            item: reduceButton, attribute: .height,
                                            relatedBy: .equal,
                                            toItem: nil, attribute: .notAnAttribute,
                                            multiplier: 1, constant: buttonSize)
        
        self.view.addConstraints([verticalIncreaseBtnConstraint, verticalReduceBtnConstraint,
                                  horizontalIncreaseBtnConstraint, horizontalReduceBtnConstraint,
                                  heightIncreaseBtnConstraint, heightReduceBtnConstraint,
                                  widthIncreaseBtnConstraint, widthReduceBtnConstraint])
        
        
    }
    
    func createSearchView() {
        
        let bottomOffset = 130.0
        
        let searchView = SearchView()
        searchView.backgroundColor = .white
        view.addSubview(searchView)
        searchView.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalConstraint = NSLayoutConstraint(item: searchView, attribute: .top, relatedBy: .lessThanOrEqual, toItem: view, attribute: .bottom, multiplier: 1, constant: -bottomOffset)
        let horizontalConstraint = NSLayoutConstraint(item: searchView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: searchView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: searchView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0)
        view.addConstraints([verticalConstraint, horizontalConstraint,
                            widthConstraint, heightConstraint])
    }
    
    @objc func increaseMap(sender: UIButton) {
        print("increase")
    }
    
    @objc func reduceMap(sender: UIButton) {
        print("reduce")
    }
}

