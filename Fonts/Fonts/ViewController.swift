//
//  ViewController.swift
//  Fonts
//
//  Created by Павел Гришутенко on 08.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0,
                                              width: self.view.frame.maxX, height: self.view.frame.maxY) )
        tableView?.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("namber of ")
    }
}

