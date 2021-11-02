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
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
    
  func setupView() {
    view.addSubview(backButton)
  }
    
  @objc func closeProfileView(sender: UIButton) {
    dismiss(animated: true)
  }
}
