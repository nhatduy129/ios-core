//
//  SecondTabVC.swift
//  15.NotificationCenter
//
//  Created by Duy Nguyen on 13/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondTabVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushNotificationButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: .demoNotificaiton, object: nil)
    }
}
