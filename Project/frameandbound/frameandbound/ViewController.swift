//
//  ViewController.swift
//  frameandbound
//
//  Created by Duy Nguyen on 4/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var demoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let bounds = demoView.bounds
        demoView.bounds = CGRect(x: bounds.minX, y: 100,
                             width: bounds.width, height: bounds.height)
    }
}

