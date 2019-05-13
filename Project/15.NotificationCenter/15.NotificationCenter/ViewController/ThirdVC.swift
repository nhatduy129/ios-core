//
//  ThirdVC.swift
//  15.NotificationCenter
//
//  Created by Duy Nguyen on 13/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ThirdVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(demo), name: .demoNotificaiton, object: nil)
    }
    
    @objc func demo() {
        print("\(self.className): Notification Center is pushed")
    }
}
