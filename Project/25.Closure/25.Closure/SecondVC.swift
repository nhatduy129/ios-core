//
//  SecondVC.swift
//  25.Closure
//
//  Created by Duy Nguyen on 15/7/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: {[weak self] _ in
            self?.printSomething()
        })
    }
    
    private func printSomething() {
        print("In timer")
    }
    
    deinit {
        print("SecondVC is deallocated.")
    }
}
