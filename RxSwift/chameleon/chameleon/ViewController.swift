//
//  ViewController.swift
//  chameleon
//
//  Created by Павел Гришутенко on 20.01.2022.
//

import UIKit
import RxSwift
import ChameleonFramework

class ViewController: UIViewController {
  var circleView: UIView!
  var circleViewModel = CircleViewModel()
  var disposeBag = DisposeBag()
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  func setup() {
    circleView = UIView(frame: CGRect(origin: view.center, size: CGSize(width: 100.0, height: 100.0)))
    circleView.layer.cornerRadius = circleView.frame.width / 2.0
    circleView.center = view.center
    circleView.backgroundColor = .green
    view.addSubview(circleView)
    
    let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(circleMoved(recognizer:)))
    circleView.addGestureRecognizer(gestureRecognizer)
    
    circleView.rx.observe(CGPoint.self, "center")
      .bind(to: circleViewModel.centerVariable)
      .disposed(by: disposeBag)
    
    subscribeOnCircleViewModel()
  }

  func subscribeOnCircleViewModel() {
    circleViewModel.backgroundColorObservable
      .subscribe(onNext: { [weak self] backgroundColor in
        UIView.animate(withDuration: 0.1) {
          self?.circleView.backgroundColor = backgroundColor
            // Пробуем получить дополнительный цвет для данного фонового
          let viewBackgroundColor = UIColor(complementaryFlatColorOf: backgroundColor)
                // Если он отличается от него
          if viewBackgroundColor != backgroundColor {
                    // Назначим его фоновым для view
                    // Нам всего лишь нужен другой цвет, чтобы разглядеть окружность в представлении view
          self?.view.backgroundColor = viewBackgroundColor
          }
        }
        })
        .disposed(by: disposeBag)
  }
  @objc func circleMoved(recognizer: UIPanGestureRecognizer) {
    let location = recognizer.location(in: view)
    UIView.animate(withDuration: 0.1) {
        self.circleView.center = location
    }
  }
}

