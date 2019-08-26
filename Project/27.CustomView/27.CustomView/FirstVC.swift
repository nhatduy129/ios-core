//
//  ViewController.swift
//  27.CustomView
//
//  Created by Duy Nguyen on 18/8/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    let customView: CustomView = CustomView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(customView)
    }
}
