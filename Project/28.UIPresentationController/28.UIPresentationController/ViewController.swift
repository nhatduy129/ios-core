//
//  ViewController.swift
//  28.UIPresentationController
//
//  Created by Duy Nguyen on 26/8/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBAction func tap(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pvc = storyboard.instantiateViewController(withIdentifier: "CustomTableViewController") as! UITableViewController
        
        pvc.modalPresentationStyle = UIModalPresentationStyle.custom
        pvc.transitioningDelegate = self
        pvc.view.backgroundColor = UIColor.red
        
        self.present(pvc, animated: true, completion: nil)
        
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfSizePresentationController(presented: presented, presenting: presentingViewController, presentedPercent: 0.6)
    }
}

class HalfSizePresentationController : UIPresentationController {
    
    var presentedPercent: Float
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        presentedPercent = 1
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    convenience init(presented: UIViewController, presenting: UIViewController?, presentedPercent: Float) {
        self.init(presentedViewController: presented, presenting: presenting)
        self.presentedPercent = presentedPercent
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            guard let containerView = containerView else { return .zero }
            let top = containerView.bounds.height * CGFloat(1 - presentedPercent)
            let height = containerView.bounds.height * CGFloat(presentedPercent)
            return CGRect(x: 0, y: top, width: containerView.bounds.width, height: height)
        }
    }
    
//    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
//        super.preferredContentSizeDidChange(forChildContentContainer: container)
//        UIView.animate(withDuration: 1, animations: {[weak self] in
//            self?.presentedView?.layoutIfNeeded()
//        })
//    }
}
