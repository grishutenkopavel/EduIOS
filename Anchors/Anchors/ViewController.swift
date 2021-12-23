//
//  ViewController.swift
//  Anchors
//
//  Created by Павел Гришутенко on 24.12.2021.
//

import UIKit

class ViewController: UIViewController {
  lazy var redView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    return view
  }()
  lazy var greenView: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    return view
  }()
  lazy var blueView: UIView = {
    let view = UIView()
    view.backgroundColor = .blue
    return view
  }()
  lazy var yellowView: UIView = {
    let view = UIView()
    view.backgroundColor = .yellow
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let stackView = UIStackView(arrangedSubviews: [redView, greenView, blueView, yellowView])
    
    view.addSubview(stackView)

    setConstraints()
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      redView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
      redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
      redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
      redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
    ])
    
    NSLayoutConstraint.activate([
      greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
      greenView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
      greenView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
    ])

    NSLayoutConstraint.activate([
      blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      blueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
      blueView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
      blueView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
    ])

    NSLayoutConstraint.activate([
      yellowView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      yellowView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
      yellowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
      yellowView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
    ])
    
  }

}

