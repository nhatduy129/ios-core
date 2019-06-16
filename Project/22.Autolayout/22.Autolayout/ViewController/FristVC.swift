//
//  ViewController.swift
//  22.Autolayout
//
//  Created by Duy Nguyen on 16/6/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeTextButtonTapped(_ sender: Any) {
        if textLabel.text == "nhat duy" {
            textLabel.text = "nhat duy nguyen vu nhat duy nguyen vu nhat duy nguyen vu nhat duy nguyen vu nhat duy nguyen vu nhat duy nguyen vu nhat duy nguyen vu nhat duy nguyen vu nhat duy nguyen vu "
        } else {
            textLabel.text = "nhat duy"
        }
    }
    
}

