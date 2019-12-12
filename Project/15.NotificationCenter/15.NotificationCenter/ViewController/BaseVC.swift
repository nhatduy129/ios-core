//
//  BaseVC.swift
//  15.NotificationCenter
//
//  Created by Duy Nguyen on 13/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(demo), name: Notification.Name("DemoNotificationCustom"), object: nil)
    }
    
    @objc private func demo() {
        print("\(self.className): Notification Custom is pushed")
    }
    
    deinit {
        print("deinit \(self.className)")
    }
}
