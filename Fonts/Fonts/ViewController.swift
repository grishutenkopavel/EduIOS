//
//  ViewController.swift
//  Fonts
//
//  Created by Павел Гришутенко on 08.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var tableView: UITableView?
    let familyFontsArray = UIFont.familyNames
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 60,
                                              width: self.view.frame.maxX, height: self.view.frame.maxY) )
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        print("namber of section in tableView")
        return familyFontsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("namber of rows in section \(section)")
        let fontNamesArray = UIFont.fontNames(forFamilyName: familyFontsArray[section])
        return fontNamesArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return familyFontsArray[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cell for row at index path: {\(indexPath.section), \(indexPath.row)}")
        let identifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell != nil {
            print("cell reused")
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        let fontName = UIFont.fontNames(forFamilyName: familyFontsArray[indexPath.section])[indexPath.row]
        cell?.textLabel?.text = "\(indexPath.row + 1). \(fontName)"
        cell?.textLabel?.font = UIFont(name: fontName, size: 16)
        return cell!
    }
    
}

