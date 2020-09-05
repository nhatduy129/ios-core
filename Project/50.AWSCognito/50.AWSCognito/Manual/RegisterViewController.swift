//
//  RegisterViewController.swift
//  50.AWSCognito
//
//  Created by Duy Nguyen on 5/9/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import Amplify

class RegisterViewController: UIViewController {
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    
    @IBAction private func registerButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, username.count >= 3 else { return }
        guard let password = passwordTextField.text, password.count >= 6 else { return }
        guard let email = emailTextField.text, email.count >= 10 else { return }
        let option = AuthSignUpRequest.Options(userAttributes: [
            AuthUserAttribute(AuthUserAttributeKey.email, value: email)
        ])
        Amplify.Auth.signUp(username: username, password: password,
                            options: option) { result in
                                switch result {
                                case .success:
                                    print("Sign Up success")
                                case .failure(let error):
                                    print(error)
                                }
        }
    }
}
