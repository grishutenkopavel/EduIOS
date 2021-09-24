//
//  ViewController.swift
//  diplom
//
//  Created by Павел Гришутенко on 23.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchView = SearchView(frame: CGRect(x: view.frame.minX, y: view.frame.midY+325,
                                           width: view.frame.maxX, height: view.frame.midY+100))
        searchView.backgroundColor = .cyan
        view.addSubview(searchView)
    }

}

