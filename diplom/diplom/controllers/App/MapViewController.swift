//
//  ViewController.swift
//  diplom
//
//  Created by Павел Гришутенко on 23.09.2021.
//

import UIKit
import YandexMapsMobile

class MapViewController: UIViewController {
  var mapView: YMKMapView?
  var searchView: SearchView?
  lazy var profileButton: UIButton = {
    let profileButtonWidth = 50
    let profileButtonHeight = 50
    let button = UIButton(frame: CGRect(x: 50, y: 50, width: profileButtonWidth, height: profileButtonHeight))
    button.setImage(UIImage(named: "profile.png"), for: .normal)
    button.addTarget(self, action: #selector(openProfileView(sender:)), for: .touchUpInside)
        
    return button
  }()
  lazy var increaseButton: UIButton = {
    let increaseButtonWidth = 50
    let increaseButtonHeight = 50
    let borderOffset = 20
    let button = UIButton(frame: CGRect(x: Int(view.bounds.maxX) - increaseButtonWidth - borderOffset,
                                                y: Int(view.bounds.midY) - increaseButtonHeight - borderOffset,
                                                width: increaseButtonWidth, height: increaseButtonHeight))
    button.setImage(UIImage(named: "increaseButton.png"), for: .normal)
    button.addTarget(self, action: #selector(reduceScale(sender:)), for: .touchUpInside)
    button.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin, .flexibleTopMargin]
    return button
  }()
  lazy var reduceButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "reduceButton.png"), for: .normal)
    button.addTarget(self, action: #selector(increaseScale(sender:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
    
  func setupView() {
    createMapView()
    view.addSubview(profileButton)
    view.addSubview(increaseButton)
    setupReduceButton()
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
    
  @objc func openProfileView(sender: UIButton) {
    let profileVC = ProfileViewController()
    profileVC.modalPresentationStyle = .fullScreen
    present(profileVC, animated: false)
  }
    
  @objc func reduceScale(sender: UIButton) {
    mapView?.mapWindow.map.move(with: YMKCameraPosition(target: (mapView?.mapWindow.map.cameraPosition.target)!,
                                                        zoom: (mapView?.mapWindow.map.cameraPosition.zoom)! + 1.0,
                                                        azimuth: 0,
                                                        tilt: 0))
    }
    
  @objc func increaseScale(sender: UIButton) {
    mapView?.mapWindow.map.move(with: YMKCameraPosition(target: (mapView?.mapWindow.map.cameraPosition.target)!,
                                                        zoom: (mapView?.mapWindow.map.cameraPosition.zoom)! - 1.0,
                                                        azimuth: 0,
                                                        tilt: 0))
    }
  func setupReduceButton() {
    view.addSubview(reduceButton)
    
    let reduceButtonWidth = 50
    let reduceButtonHeight = 50
    let borderOffset = 20
    let verticalConstraint = NSLayoutConstraint(item: reduceButton, attribute: .top, relatedBy: .equal, toItem: increaseButton, attribute: .bottom, multiplier: 1, constant: CGFloat(borderOffset))
    let horizontalConstraint = NSLayoutConstraint(item: reduceButton, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: CGFloat(-borderOffset))
    let widthConstraint = NSLayoutConstraint(item: reduceButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(reduceButtonWidth))
    let heightConstraint = NSLayoutConstraint(item: reduceButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(reduceButtonHeight))
    
    view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
  }
  func createSearchView() {
    searchView = SearchView()
    searchView?.translatesAutoresizingMaskIntoConstraints = false
    let swipeGestureDown = UISwipeGestureRecognizer(target: self, action: #selector(dismisSearchView(sender:)))
    swipeGestureDown.direction = .down
    let swipeGestureUp = UISwipeGestureRecognizer(target: self, action: #selector(showSearchView(sender:)))
    swipeGestureUp.direction = .up
    searchView?.addGestureRecognizer(swipeGestureDown)
    searchView?.addGestureRecognizer(swipeGestureUp)
    searchView?.transform = CGAffineTransform(translationX: 0,
                                              y: view.bounds.maxY - SearchViewPosition.mediumLayout.rawValue)
    if let searchView = searchView {
      view.addSubview(searchView)
    }
        
    let horizontalConstraint = NSLayoutConstraint(item: searchView!, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
    let widthConstraint = NSLayoutConstraint(item: searchView!, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
    let heightConstraint = NSLayoutConstraint(item: searchView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.bounds.height)
    
    view.addConstraints([horizontalConstraint, widthConstraint, heightConstraint])
  }
  
  @objc func dismisSearchView(sender: UISwipeGestureRecognizer) {
    searchView?.transform = CGAffineTransform(translationX: 0,
                                              y: view.bounds.maxY - SearchViewPosition.lowerLayout.rawValue)
  }
  
  @objc func showSearchView(sender: UISwipeGestureRecognizer) {
    searchView?.transform = CGAffineTransform(translationX: 0,
                                              y: view.bounds.maxY - SearchViewPosition.mediumLayout.rawValue)
  }
}
