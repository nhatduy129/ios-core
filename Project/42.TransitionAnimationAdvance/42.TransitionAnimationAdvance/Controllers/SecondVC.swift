//
//  SecondVC.swift
//  42.TransitionAnimationAdvance
//
//  Created by Duy Nguyen on 26/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondVC: BasePresentedVC {
    
    override var widthPresentedPercent: Float { return 0.9 }
    override var heightPresentedPercent: Float { return 0.8 }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
