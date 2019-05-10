//
//  ViewController.swift
//  12.JNKeychain
//
//  Created by Duy Nguyen on 10/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import JNKeychain

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var count: Int = 0 {
        didSet {
            label.text = "Count: \(count)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = (JNKeychain.loadValue(forKey: "count") as? Int) ?? 0
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        count += 1
        JNKeychain.saveValue(count, forKey: "count")
    }
}

