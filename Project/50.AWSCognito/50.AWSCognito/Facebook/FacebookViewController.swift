//
//  ViewController.swift
//  50.AWSCognito
//
//  Created by Duy Nguyen on 1/9/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import AWSCore
import AWSCognitoIdentityProvider
import AWSFacebookSignIn
import Amplify
import AWSMobileClient

class FacebookViewController: UIViewController {
  private lazy var printUserAttributesButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(printUserAttributesButtonTapped), for: .touchUpInside)
    button.setTitle("Print User Attributes", for: .normal)
    button.setTitleColor(.blue, for: .normal)
    button.setTitleColor(.gray, for: .disabled)
    return button
  }()
  
  private lazy var facebookAWSLoginButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(facebookAWSLoginButtonTapped), for: .touchUpInside)
    button.setTitle("Facebook Login", for: .normal)
    button.setTitleColor(.blue, for: .normal)
    button.setTitleColor(.gray, for: .disabled)
    return button
  }()
  
  private lazy var logoutButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    button.setTitle("Logout", for: .normal)
    button.setTitleColor(.blue, for: .normal)
    button.setTitleColor(.gray, for: .disabled)
    button.isEnabled = false
    return button
  }()
  
  private var loginState: Bool = false {
    didSet {
      DispatchQueue.main.async { [unowned self] in
        self.facebookAWSLoginButton.isEnabled = !self.loginState
        self.logoutButton.isEnabled = self.loginState
        self.printUserAttributesButton.isEnabled = self.loginState
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(facebookAWSLoginButton)
    view.addSubview(logoutButton)
    view.addSubview(printUserAttributesButton)
    layoutConstraint()
    //fetchCurrentAuthSession()
    print("AWSSignInManager.sharedInstance().isLoggedIn: \(AWSSignInManager.sharedInstance().isLoggedIn)")
  }
  
  func fetchCurrentAuthSession() {
    Amplify.Auth.fetchAuthSession {[weak self] result in
      switch result {
      case .success(let session):
        print("Is user signed in - \(session.isSignedIn)")
        self?.loginState = true
      case .failure(let error):
        self?.loginState = false
        print("Fetch session failed with error \(error)")
      }
    }
    
//        AWSMobileClient.default().initialize { (state, err) in
//          switch state {
//          case .signedIn:
//            print("Is user signed in - true")
//          case .signedOut, .signedOutFederatedTokensInvalid, .signedOutUserPoolsTokenInvalid:
//            print("Signed Out")
//          default: break
//          }
//        }
  }
  
  private func layoutConstraint() {
    NSLayoutConstraint.activate([
      facebookAWSLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      facebookAWSLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      logoutButton.topAnchor.constraint(equalTo: facebookAWSLoginButton.bottomAnchor, constant: 50),
      logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      printUserAttributesButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 50),
      printUserAttributesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
  }
  
  @objc private func facebookAWSLoginButtonTapped() {
    /// Login with Amplify.Auth
//    Amplify.Auth.signInWithWebUI(for: .facebook,
//                                 presentationAnchor: UIApplication.shared.windows.first!) { [weak self] result in
//                                  switch result {
//                                  case .success:
//                                    print("Sign in succeeded")
//                                    self?.getTokens()
//                                    self?.loginState = true
//                                  case .failure(let error):
//                                    print("Sign in failed \(error)")
//                                  }
//    }
    
            let hostedUIOptions = HostedUIOptions(scopes: ["profile","email"], identityProvider: "Facebook")
            AWSMobileClient.default().showSignIn(navigationController: self.navigationController!, hostedUIOptions: hostedUIOptions) { (userState, error) in
                if let error = error as? AWSMobileClientError {
                    print(error.localizedDescription)
                }
                if let userState = userState {
                    print("Status: \(userState.rawValue)")
                }
            }
  }
  
  private func getTokens() {
    AWSMobileClient.default().getIdentityId().continueWith { (task) in
      guard task.error == nil else {
        print("Error: \(task.error?.localizedDescription ?? "")")
        return nil
      }
      print("ClientId: \((task.result ?? "") as String)")
      
      return nil
    }
    
    Amplify.Auth.fetchUserAttributes { (result) in
      switch result {
      case .success(let info):
        print(info)
      case .failure(let error):
        print(error)
      }
    }
    
    AWSMobileClient.default().getTokens { (tokens, err) in
      print("AccessToken: \((tokens?.accessToken?.tokenString ?? "") as String)")
    }
  }
  
  @objc private func logoutButtonTapped() {
    /// Sign out with Amplify
    Amplify.Auth.signOut { (result) in
      switch result {
      case .success:
        print("Signed Out")
        self.loginState = false
      case .failure(_):
        print("Sign Out failed")
      }
    }
    
    /// SignOut with AWSMobileClient
    //    AWSMobileClient.default().signOut()
  }
  
  @objc private func printUserAttributesButtonTapped() {
    Amplify.Auth.fetchUserAttributes(listener: { result in
      switch result {
      case .success(let attributes):
        print("get attributes successfully")
        print(attributes)
      case .failure(let error):
        print("get attributes failed")
        print(error)
      }
    })
  }
}
