//
//  PresentationController.swift
//  42.TransitionAnimationAdvance
//
//  Created by Duy Nguyen on 26/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class BasePresentedVC: UIViewController, UIViewControllerTransitioningDelegate {
    var widthPresentedPercent: Float { return 0.8 }
    var heightPresentedPercent: Float { return 0.5 }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presented: presented, presenting: presenting,
                                      widthPercent: self.widthPresentedPercent, heightPercent: self.heightPresentedPercent)
    }
}

fileprivate class PresentationController : UIPresentationController {
    private var widthPercent: Float = 1
    private var heightPercent: Float = 1
    
    private override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    convenience init(presented: UIViewController, presenting: UIViewController?, widthPercent: Float, heightPercent: Float) {
        self.init(presentedViewController: presented, presenting: presenting)
        self.widthPercent = widthPercent
        self.heightPercent = heightPercent
    }
    
    override func presentationTransitionWillBegin() {
        guard let viewToAnimate = self.containerView else { return }
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: {_ in
            viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        guard let viewToAnimate = self.containerView else { return }
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: {_ in
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)  // If put 0, it does not work
        }, completion: nil)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        return CGRect(x: containerView.bounds.width * CGFloat(1 - self.widthPercent) / 2,
                      y: containerView.bounds.height * CGFloat(1 - self.heightPercent) / 2,
                      width: containerView.bounds.width * CGFloat(self.widthPercent),
                      height: containerView.bounds.height * CGFloat(self.heightPercent))
    }
}
