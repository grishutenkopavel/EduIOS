//
//  PresentableViewController.swift
//  customTransitionAnimation
//
//  Created by Павел Гришутенко on 25.10.2021.
//

import Foundation
import UIKit

class PresentableViewController: UIViewController {
    private let exitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exitButton.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 100, height: 50))
        exitButton.setTitle("Закрыть", for: .normal)
        exitButton.setTitleColor(.blue, for: .normal)
        exitButton.addTarget(self, action: #selector(closeView(sender:)), for: .touchUpInside)
        view.addSubview(exitButton)

        view.backgroundColor = .lightGray
    }
    
    @objc func closeView(sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
}
