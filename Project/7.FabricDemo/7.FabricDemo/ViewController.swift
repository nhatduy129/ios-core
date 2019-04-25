//
//  ViewController.swift
//  7.FabricDemo
//
//  Created by Duy Nguyen on 25/4/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import Crashlytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonZeroTapped(_ sender: UIButton) {
        sender.titleLabel?.text = "\(5/("abc".count-3)))"
    }
}

