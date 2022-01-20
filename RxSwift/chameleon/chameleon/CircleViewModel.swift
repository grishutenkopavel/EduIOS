//
//  CircleViewModel.swift
//  chameleon
//
//  Created by Павел Гришутенко on 20.01.2022.
//

import Foundation
import RxSwift
import RxCocoa
import ChameleonFramework

class CircleViewModel {
    
  var centerVariable: BehaviorSubject<CGPoint?>!
  var backgroundColorObservable: Observable<UIColor>!
  
  init() {
    centerVariable = BehaviorSubject<CGPoint?>(value: CGPoint(x: 0, y: 0))
    setup()
  }

  func setup() {
    backgroundColorObservable = centerVariable.asObservable()
      .map { center in
        guard let center = center else { return UIColor.flatten(.black)() }
        
        let red: CGFloat = (center.x + center.y).truncatingRemainder(dividingBy: 255.0) / 255.0 // Мы просто манипулируем красным, но вы можете делать то же самое с белым или зелёным
        let green: CGFloat = 0.0
        let blue: CGFloat = 0.0
        
        return UIColor.flatten(UIColor(red: red, green: green, blue: blue, alpha: 1.0))()
      }
  }
}
