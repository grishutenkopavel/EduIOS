//
//  SearchViewController.swift
//  diplom
//
//  Created by Павел Гришутенко on 24.09.2021.
//

import Foundation
import UIKit

class SearchView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .cyan
    }
}

