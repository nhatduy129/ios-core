//
//  AnimationController.swift
//  42.TransitionAnimationAdvance
//
//  Created by Duy Nguyen on 26/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class AnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var animationDuration: Double
    private var animationType: AnimationType
    
    enum AnimationType {
        case present
        case dismiss
    }
    
    init(animationDuration: Double, animationType: AnimationType) {
        self.animationDuration = animationDuration
        self.animationType = animationType
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: self.animationDuration) ?? 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to),
            let fromVC = transitionContext.viewController(forKey: .from) else {
                transitionContext.completeTransition(false)
                return
        }
        switch self.animationType {
        case .present:
            self.presentAnimation(with: transitionContext, viewToAnimate: toVC.view)
            transitionContext.containerView.addSubview(toVC.view)
        case .dismiss:
            print("dismiss")
        }
    }
    
    func presentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, delay: 0,
                       usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1,
                       options: .curveEaseInOut,
                       animations: {
                        viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) {_ in
            transitionContext.completeTransition(true)
        }
    }
}
