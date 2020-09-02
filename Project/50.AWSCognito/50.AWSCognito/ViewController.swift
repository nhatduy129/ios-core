//
//  ViewController.swift
//  50.AWSCognito
//
//  Created by Duy Nguyen on 1/9/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, LoginButtonDelegate {
    private lazy var facebookLoginButton: FBLoginButton = {
        let button = FBLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.delegate = self
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(facebookLoginButton)
        layoutConstraint()
    }
    
    private func layoutConstraint() {
        NSLayoutConstraint.activate([
            facebookLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            facebookLoginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            facebookLoginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
    }
    
    // MARK: - Facebook LoginButtonDelegate
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("FBSDKLoginKit.AccessToken.current: \(FBSDKLoginKit.AccessToken.current)")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("loginButtonDidLogOut")
    }
}
