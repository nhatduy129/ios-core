//
//  LoginViewController.swift
//  50.AWSCognito
//
//  Created by Duy Nguyen on 5/9/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import Amplify

class LoginViewController: UIViewController {
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBAction private func loginButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, username.count >= 3 else { return }
        guard let password = passwordTextField.text, password.count >= 6 else { return }
        Amplify.Auth.signIn(username: username, password: password) { result in
            switch result {
            case .success:
                print("Sign in success")
                print("Amplify.Auth.getCurrentUser()?.username: \(String(describing: Amplify.Auth.getCurrentUser()?.username))")
            case .failure(let error):
                print(error)
            }
        }
    }
}
