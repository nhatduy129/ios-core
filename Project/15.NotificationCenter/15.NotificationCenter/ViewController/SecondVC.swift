//
//  SecondVC.swift
//  15.NotificationCenter
//
//  Created by Duy Nguyen on 13/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondVC: BaseVC {


    
    @IBAction func goToThirdVCButtonTapped(_ sender: Any) {
        let vc = ThirdVC(nibName: "ThirdVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}
