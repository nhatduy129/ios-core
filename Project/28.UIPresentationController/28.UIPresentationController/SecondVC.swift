//
//  SecondVC.swift
//  28.UIPresentationController
//
//  Created by Duy Nguyen on 27/12/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if let pc = self.presentationController as? HalfSizePresentationController {
            UIView.animate(withDuration: 1, animations: {[weak self] in
                pc.presentedView?.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
            })
        } else {
            print("No")
        }
    }
}
