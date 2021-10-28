//
//  ProfileViewController.swift
//  diplom
//
//  Created by Павел Гришутенко on 28.10.2021.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    var backButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        let buttonWidth = 100
        let buttonHeight = 100
        backButton = UIButton(frame: CGRect(x: Int(view.bounds.midX) - buttonWidth / 2,
                                            y: Int(view.bounds.midY) - buttonHeight / 2,
                                            width: buttonWidth, height: buttonHeight))
        backButton?.setTitle("Back", for: .normal)
        backButton?.addTarget(self, action: #selector(closeProfileView(sender:)), for: .touchUpInside)
        
        if let backButton = backButton {
            view.addSubview(backButton)
        }
    }
    
    @objc func closeProfileView(sender: UIButton) {
        dismiss(animated: true)
    }
}
