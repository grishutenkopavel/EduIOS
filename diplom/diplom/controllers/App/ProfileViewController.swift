//
//  ProfileViewController.swift
//  diplom
//
//  Created by Павел Гришутенко on 28.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
  lazy var backButton: UIButton = {
    let buttonWidth = 100
    let buttonHeight = 100
    let button = UIButton(frame: CGRect(x: Int(view.bounds.midX) - buttonWidth / 2,
                                            y: Int(view.bounds.midY) - buttonHeight / 2,
                                            width: buttonWidth, height: buttonHeight))
    button.setTitle("Back", for: .normal)
    button.addTarget(self, action: #selector(closeProfileView(sender:)), for: .touchUpInside)
    return button
  }()
  var tableView: UITableView?

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
    
  func setupView() {
    view.addSubview(backButton)
    
    tableView = UITableView(frame: CGRect(x: 0, y: 500,
                                          width: view.frame.maxX, height: view.frame.maxY) )
    tableView?.dataSource = self
    view.addSubview(tableView!)
  }
    
  @objc func closeProfileView(sender: UIButton) {
    dismiss(animated: true)
  }
}


extension ProfileViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
      
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
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
    cell?.textLabel?.text = "\(indexPath.row + 1)."
    return cell!
  }
  
}
