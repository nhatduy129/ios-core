//
//  ViewController.swift
//  6.AnimationRandomly
//
//  Created by Duy Nguyen on 19/4/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var squareView: MovingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        squareView.startMovingRandomly()
    }
}

