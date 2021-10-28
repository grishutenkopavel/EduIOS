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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        createMapView()
        createProfileButton()
        createIncreaseButton()
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
}

