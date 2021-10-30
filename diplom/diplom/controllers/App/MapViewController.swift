//
//  ViewController.swift
//  diplom
//
//  Created by Павел Гришутенко on 23.09.2021.
//

import UIKit
import YandexMapsMobile

@IBDesignable
class MapViewController: UIViewController {
    var mapView: YMKMapView?
    var profileButton: UIButton?
    var increaseButton: UIButton?
    var reduceButton: UIButton?
    var searchView: SearchView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        createMapView()
        createProfileButton()
        createIncreaseButton()
        createReduceButton()
        createSearchView()
    }
    
    func createMapView() {
        let TARGET_LOCATION = YMKPoint(latitude: 59.945933, longitude: 30.320045)
        mapView = YMKMapView(frame: CGRect(x: view.bounds.minX, y: view.bounds.minY,
                                           width: view.bounds.maxX, height: view.bounds.maxY))
        
        
        mapView?.mapWindow.map.move(
                    with: YMKCameraPosition(target: TARGET_LOCATION, zoom: 15, azimuth: 0, tilt: 0),
                    animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
                    cameraCallback: nil)
        
        if let mapView = mapView {
            view.addSubview(mapView)
        }
    }
    
    func createProfileButton() {
        let profileButtonWidth = 50
        let profileButtonHeight = 50
        profileButton = UIButton(frame: CGRect(x: 50, y: 50,
                                               width: profileButtonWidth, height: profileButtonHeight))
        profileButton?.setImage(UIImage(named: "profile.png"), for: .normal)
        profileButton?.addTarget(self, action: #selector(openProfileView(sender:)), for: .touchUpInside)
        
        if let button = profileButton {
            view.addSubview(button)
        }
    }
    
    @objc func openProfileView(sender: UIButton) {
        let profileVC = ProfileViewController()
        profileVC.modalPresentationStyle = .fullScreen
        present(profileVC, animated: false)
    }
    
    func createIncreaseButton() {
        let increaseButtonWidth = 50
        let increaseButtonHeight = 50
        let borderOffset = 20
        increaseButton = UIButton(frame: CGRect(x: Int(view.bounds.maxX) - increaseButtonWidth - borderOffset,
                                                y: Int(view.bounds.midY) - increaseButtonHeight - borderOffset,
                                                width: increaseButtonWidth, height: increaseButtonHeight))
        increaseButton?.setImage(UIImage(named: "increaseButton.png"), for: .normal)
        increaseButton?.addTarget(self, action: #selector(reduceScale(sender:)), for: .touchUpInside)
        increaseButton?.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin, .flexibleTopMargin]
        
        if let button = increaseButton {
            view.addSubview(button)
        }
    }
    
    @objc func reduceScale(sender: UIButton) {
        mapView?.mapWindow.map.move(
            with: YMKCameraPosition(target: (mapView?.mapWindow.map.cameraPosition.target)!,
                                    zoom: (mapView?.mapWindow.map.cameraPosition.zoom)! + 1.0,
                                    azimuth: 0, tilt: 0))
    }
    
    func createReduceButton() {
        let reduceButtonWidth = 50
        let reduceButtonHeight = 50
        let borderOffset = 20
        reduceButton = UIButton()
        reduceButton?.setImage(UIImage(named: "reduceButton.png"), for: .normal)
        reduceButton?.addTarget(self, action: #selector(increaseScale(sender:)), for: .touchUpInside)
        reduceButton?.translatesAutoresizingMaskIntoConstraints = false
        
        if let button = reduceButton {
            view.addSubview(button)
        }
        let verticalConstraint = NSLayoutConstraint(item: reduceButton!, attribute: .top, relatedBy: .equal, toItem: increaseButton, attribute: .bottom, multiplier: 1, constant: CGFloat(borderOffset))
        let horizontalConstraint = NSLayoutConstraint(item: reduceButton!, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: CGFloat(-borderOffset))
        let widthConstraint = NSLayoutConstraint(item: reduceButton!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(reduceButtonWidth))
        let heightConstraint = NSLayoutConstraint(item: reduceButton!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(reduceButtonHeight))
    
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    @objc func increaseScale(sender: UIButton) {
        mapView?.mapWindow.map.move(
            with: YMKCameraPosition(target: (mapView?.mapWindow.map.cameraPosition.target)!,
                                    zoom: (mapView?.mapWindow.map.cameraPosition.zoom)! - 1.0,
                                    azimuth: 0, tilt: 0))
    }
    
    func createSearchView() {
        searchView = SearchView()
        searchView?.translatesAutoresizingMaskIntoConstraints = false

        if let searchView = searchView {
            view.addSubview(searchView)
        }
        
        let verticalConstraint = NSLayoutConstraint(item: searchView!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -500.0)
        let horizontalConstraint = NSLayoutConstraint(item: searchView!, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: searchView!, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: searchView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.bounds.height)
    
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
}
