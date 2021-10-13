//
//  SearchViewController.swift
//  diplom
//
//  Created by Павел Гришутенко on 24.09.2021.
//

import Foundation
import UIKit

class SearchView: UIView {
    var isBottom: Bool = true
    var heightOffset: CGFloat = 400
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let swipeUpGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeUpGestureAction(sender:)))
        let swipeDownGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDownGestureAction(sender:)))
        
        swipeUpGestureRecognizer.direction = .up
        swipeDownGestureRecognizer.direction = .down
        
        self.addGestureRecognizer(swipeUpGestureRecognizer)
        self.addGestureRecognizer(swipeDownGestureRecognizer)
        
        //MARK: controllers
        
        let searchBar = UISearchBar(frame: CGRect(x: bounds.minX + 20,
                                                  y: bounds.minY + 20,
                                                  width: bounds.maxX - 30,
                                                  height: bounds.minY + 50))
        searchBar.text = "search"
        self.addSubview(searchBar)
        
        let slider = UISlider(frame: CGRect(x: bounds.minX + 20,
                                            y: bounds.minY + 70,
                                            width: bounds.maxX - 30,
                                            height: bounds.minY + 90))
        self.addSubview(slider)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: search view transition
    @objc func swipeUpGestureAction(sender: UISwipeGestureRecognizer) {
        if isBottom && sender.direction == .up {
            self.transform = self.transform.concatenating(CGAffineTransform(translationX: 0, y: -heightOffset))
            isBottom = false
        }
    }
    
    @objc func swipeDownGestureAction(sender: UISwipeGestureRecognizer) {
        if !isBottom && sender.direction == .down {
            self.transform = self.transform.concatenating(CGAffineTransform(translationX: 0, y: heightOffset))
            isBottom = true
        }
    }
}

