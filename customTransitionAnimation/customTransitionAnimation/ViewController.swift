//
//  ViewController.swift
//  customTransitionAnimation
//
//  Created by Павел Гришутенко on 25.10.2021.
//

import UIKit

class ViewController: UIViewController {

    private let openViewButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openViewButton.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 100, height: 50))
        openViewButton.setTitle("Открыть", for: .normal)
        openViewButton.setTitleColor(.blue, for: .normal)
        openViewButton.addTarget(self, action: #selector(openView(sender:)), for: .touchUpInside)
        view.addSubview(openViewButton)

    }
    
    @objc func openView(sender: UIButton){
        let secondVC = PresentableViewController()
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
        present(secondVC, animated: true, completion: nil)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

extension ViewController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        
        let originalSize = toView?.frame.size
        let offScreenRight = CGAffineTransform(scaleX: 0.5, y: 0.4)
        toView?.transform = offScreenRight.concatenating(CGAffineTransform(translationX: 0, y: -150))
        if let view = toView {
            view.frame = CGRect(origin: view.frame.origin, size: CGSize(width: 10, height: 10))
            view.layer.cornerRadius = view.frame.width / 2
            
            container.addSubview(view)
        }
        if let view = fromView {
            container.addSubview(view)
        }
                
        let duration = self.transitionDuration(using: transitionContext)
            
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.49, initialSpringVelocity: 0.81, options: [],
                       animations: { () -> Void in
                            toView?.transform = CGAffineTransform.identity
                            toView?.frame = CGRect(origin: container.frame.origin, size: originalSize!)
                            toView?.layer.cornerRadius = 0
                            }) { (finished) -> Void in
                                transitionContext.completeTransition(true)
                            }
}
}
