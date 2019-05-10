//
//  SecondVC.swift
//  13.WhenCanAccessOutlet
//
//  Created by Duy Nguyen on 10/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var k = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondVC: viewDidLoad")
    }
}
