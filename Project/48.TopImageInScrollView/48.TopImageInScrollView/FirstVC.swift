//
//  FirstVC.swift
//  48.TopImageInScrollView
//
//  Created by Duy Nguyen on 17/7/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    @IBAction func buttonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SecondVC")
        navigationController?.pushViewController(vc, animated: true)
    }

}

