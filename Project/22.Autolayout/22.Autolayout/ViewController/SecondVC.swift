//
//  SecondVC.swift
//  22.Autolayout
//
//  Created by Duy Nguyen on 16/6/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.removeFromSuperview()
    }
}
