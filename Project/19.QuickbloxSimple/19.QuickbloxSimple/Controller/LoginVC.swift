//
//  ViewController.swift
//  19.QuickbloxSimple
//
//  Created by Duy Nguyen on 28/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import KRProgressHUD

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if QuickbloxHelper.isLoggedIn == false {
            KRProgressHUD.show()
            QuickbloxHelper.login(login: emailTextField.text!, password: passwordTextField.text!, successBlock: {[weak self] _, _ in
                KRProgressHUD.dismiss()
                self?.goToChatVC()
            }, errorBlock: {error in
                print(error.description)
            })
        } else {
            goToChatVC()
        }
    }
    
    func goToChatVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        if FakeData.arrUser[0].username == emailTextField.text! {
            vc.qbUser = FakeData.arrUser[0]
        } else {
            vc.qbUser = FakeData.arrUser[1]
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

