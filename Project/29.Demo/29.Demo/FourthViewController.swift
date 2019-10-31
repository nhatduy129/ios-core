//
//  SecondViewController.swift
//  29.Demo
//
//  Created by Duy Nguyen on 28/10/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
    }
}
