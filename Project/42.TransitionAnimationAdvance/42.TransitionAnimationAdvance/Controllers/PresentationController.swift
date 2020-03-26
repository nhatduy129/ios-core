//
//  PresentationController.swift
//  42.TransitionAnimationAdvance
//
//  Created by Duy Nguyen on 26/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class PresentationController : UIPresentationController {
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
            viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
        }, completion: nil)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        return CGRect(x: containerView.bounds.width * CGFloat(self.widthPercent) / 2,
                      y: containerView.bounds.height * CGFloat(self.heightPercent) / 2,
                      width: containerView.bounds.width * CGFloat(self.widthPercent),
                      height: containerView.bounds.height * CGFloat(self.heightPercent))
    }
}
