//
//  SecondVC.swift
//  15.NotificationCenter
//
//  Created by Duy Nguyen on 13/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        //NotificationCustom.shared.addObserver(self, selector: #selector(demo), name: "DemoNotificationCustom")
        NotificationCenter.default.addObserver(self, selector: #selector(demo), name: NSNotification.Name(rawValue: "DemoNotificationCustom"), object: nil)
    }
    
    @objc func demo() {
        print("\(self.className): Notification Custom is pushed")
    }
    
    @IBAction func goToThirdVCButtonTapped(_ sender: Any) {
        let vc = ThirdVC(nibName: "ThirdVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}
