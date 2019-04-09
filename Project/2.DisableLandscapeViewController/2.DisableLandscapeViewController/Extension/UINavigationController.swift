//
//  UINavigationController.swift
//  2.DisableLandscapeViewController
//
//  Created by Duy Nguyen on 9/4/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

extension UINavigationController {

    override open var shouldAutorotate: Bool {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        get {
            return UIInterfaceOrientation.portrait
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            return UIInterfaceOrientationMask.portrait
        }
    }
}
