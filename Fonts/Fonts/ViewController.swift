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
        
        tableView = UITableView(frame: CGRect(x: 0, y: 20,
                                              width: self.view.frame.maxX, height: self.view.frame.maxY) )
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("namber of rows in section \(section)")
        return 100;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cell for row at index path: {\(indexPath.section), \(indexPath.row)}")
        let cell = UITableViewCell(style: .default, reuseIdentifier: "c1")
        cell.textLabel?.text = "Section = \(indexPath.section), row = \(indexPath.row)}"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("namber of section in tableView")
        return 1
    }
}

