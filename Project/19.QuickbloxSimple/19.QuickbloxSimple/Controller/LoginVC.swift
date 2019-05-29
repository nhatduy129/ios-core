//
//  ViewController.swift
//  19.QuickbloxSimple
//
//  Created by Duy Nguyen on 28/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if QuickbloxHelper.isLoggedIn == false {
            QuickbloxHelper.login(login: emailTextField.text!, password: passwordTextField.text!, successBlock: {[weak self] _, _ in
                guard let `self` = self else { return }
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
                self.navigationController?.pushViewController(vc, animated: true)
            }, errorBlock: {error in
                print(error.description)
            })
        }
    }
}

