//
//  SecondVC.swift
//  42.TransitionAnimationAdvance
//
//  Created by Duy Nguyen on 26/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondVC: UIViewController, UIViewControllerTransitioningDelegate {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
//    func animationController(forPresented presented: UIViewController,
//                             presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return AnimationController(animationDuration: 0.3, animationType: .present)
//    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presented: presented, presenting: presenting, widthPercent: 0.5, heightPercent: 0.5)
    }
}
