//
//  ViewController.swift
//  50.AWSCognito
//
//  Created by Duy Nguyen on 1/9/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import AWSCore
import AWSCognitoIdentityProvider
import AWSFacebookSignIn

class ViewController: UIViewController, LoginButtonDelegate {
    // This button use FBSDKLoginKit
    private lazy var facebookLoginButton: FBLoginButton = {
        let button = FBLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.delegate = self
        return button
    }()
    
    // This button use AWS Cognito
    private lazy var facebookAWSLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(facebookAWSLoginButtonTapped), for: .touchUpInside)
        button.setTitle("Facebook Login", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(facebookLoginButton)
        view.addSubview(facebookAWSLoginButton)
        view.addSubview(logoutButton)
        layoutConstraint()
        print("AWSSignInManager.sharedInstance().isLoggedIn: \(AWSSignInManager.sharedInstance().isLoggedIn)")
    }
    
    private func layoutConstraint() {
        NSLayoutConstraint.activate([
            facebookLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            facebookLoginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            facebookLoginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            facebookAWSLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            facebookAWSLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.topAnchor.constraint(equalTo: facebookAWSLoginButton.bottomAnchor, constant: 50),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc private func facebookAWSLoginButtonTapped() {
        let cognitoRegion = AWSRegionType.APSoutheast1 // Region of your Cognito Identity Pool
        let cognitoIdentityPoolId = "ap-southeast-1:ebb2ec52-2683-4bb6-b66c-eeb93fdc2868" // e.g. "us-east-1:111e111-8efa-dead-b8d7-11c7f4e00de1"
        let tokens = ["graph.facebook.com": AccessToken.current!.tokenString]
        let customIdentityProvider = CustomIdentityProvider(tokens: tokens)
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType: cognitoRegion,
                                                                identityPoolId: cognitoIdentityPoolId,
                                                                identityProviderManager: customIdentityProvider)
        let configuration = AWSServiceConfiguration(region: cognitoRegion,
                                                    credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration

        credentialsProvider.getIdentityId().continueOnSuccessWith { task in
            guard task.error == nil else { return nil }
            
            return task
        }
        print("AWSSignInManager.sharedInstance().isLoggedIn: \(AWSSignInManager.sharedInstance().isLoggedIn)")
    }
    
    @objc private func logoutButtonTapped() {
        AWSSignInManager.sharedInstance().logout(completionHandler: {(result: Any?, error: Error?) in
            //self.showSignIn()
            print("Sign-out Successful")
        })
    }
    
    // MARK: - Facebook LoginButtonDelegate
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("FBSDKLoginKit.AccessToken.current: \(FBSDKLoginKit.AccessToken.current)")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("loginButtonDidLogOut")
    }
    
    
}
