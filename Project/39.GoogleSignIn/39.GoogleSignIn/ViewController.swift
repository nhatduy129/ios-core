//
//  ViewController.swift
//  39.GoogleSignIn
//
//  Created by Duy Nguyen on 8/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().clientID = "346531105707-oeqk7k1p8mqqg82iu3g86n7m96gn963o.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        let signInButton = GIDSignInButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(signInButton)
        NSLayoutConstraint.activate([
            signInButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        // Can get user avatar URL, email address, full name, name, family Name
        print(user)
    }
}

