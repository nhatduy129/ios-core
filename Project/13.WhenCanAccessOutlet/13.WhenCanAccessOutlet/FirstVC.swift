//
//  ViewController.swift
//  13.WhenCanAccessOutlet
//
//  Created by Duy Nguyen on 10/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    @IBAction func goToSecondVCButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        vc.loadView() // must have
        vc.label.text = "abc"
        print("vc.k: \(vc.k)")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func goToThirdVCButtonTapped(_ sender: Any) {
        let vc = ThirdVC.init(nibName: "ThirdVC", bundle: nil)
        vc.loadView()
        vc.label.text = "xyz"
        navigationController?.pushViewController(vc, animated: true)
    }
}
