//
//  FirstVC.swift
//  42.TransitionAnimationAdvance
//
//  Created by Duy Nguyen on 26/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

// Refer: https://www.youtube.com/watch?v=FvdrNSi8orE&t=77s
class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showSecondVCButtonTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        self.present(vc, animated: true)
    }
}

