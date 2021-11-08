//
//  SearchViewController.swift
//  diplom
//
//  Created by Павел Гришутенко on 24.09.2021.
//

import UIKit
import MultiSlider

enum SearchViewPosition: Double {
  case lowerLayout = 200.0
  case mediumLayout = 500.0
}

class SearchView: UIView {
  var searchBar: UISearchBar?
  var tableView: UITableView?
  var multiSlider: MultiSlider = {
    let multiSlider = MultiSlider()
    multiSlider.minimumValue = 1
    multiSlider.maximumValue = 5
    multiSlider.value = [1, 5]
    multiSlider.orientation = .horizontal
    multiSlider.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 200, height: 50))
    return multiSlider
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
        
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupViews()
  }
    
  func setupViews() {
    backgroundColor = .white
    addSearchBar()
    createSearchButton()
    createSearchOptionsMenu()
  }
    
  private func addSearchBar() {
    searchBar = UISearchBar()
    searchBar?.translatesAutoresizingMaskIntoConstraints = false
    if let searchBar = searchBar {
      addSubview(searchBar)
    }
        
    let verticalConstraint = NSLayoutConstraint(item: searchBar!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: -5.0)
    let horizontalConstraint = NSLayoutConstraint(item: searchBar!, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
    let widthConstraint = NSLayoutConstraint(item: searchBar!, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -50.0)
    let heightConstraint = NSLayoutConstraint(item: searchBar!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70.0)
        addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    private func createSearchButton() {
    }
    
    private func createSearchOptionsMenu() {
      addSubview(multiSlider)
    }
}
