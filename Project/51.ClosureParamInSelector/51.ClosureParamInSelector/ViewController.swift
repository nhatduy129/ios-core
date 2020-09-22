//
//  ViewController.swift
//  51.ClosureParamInSelector
//
//  Created by Duy Nguyen on 18/9/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(demo2), userInfo: nil, repeats: true)
    }

    @objc func demo1(completion: (() -> Void)? = nil) {
        print("demo")
    }
    
    @objc func demo2(app: String? = nil) {
        print("demo")
    }
}

