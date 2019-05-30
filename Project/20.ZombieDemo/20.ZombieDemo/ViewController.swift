//
//  ViewController.swift
//  20.ZombieDemo
//
//  Created by Duy Nguyen on 30/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class Student {
    var name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Student \(name) is deallocated.")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var a: Student? = Student(name: "duy")
        a = nil
    }
}

