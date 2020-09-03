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
import Amplify
import AWSMobileClient

class ViewController: UIViewController, LoginButtonDelegate {
  // This button use FBSDKLoginKit
  private lazy var facebookLoginButton: FBLoginButton = {
    let button = FBLoginButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.delegate = self
    button.isHidden = true
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
    fetchCurrentAuthSession()
    print("AWSSignInManager.sharedInstance().isLoggedIn: \(AWSSignInManager.sharedInstance().isLoggedIn)")
  }
  
  func fetchCurrentAuthSession() {
    AWSMobileClient.default().initialize { (state, err) in
      switch state {
      case .signedIn:
        print("Is user signed in - true")
      case .signedOut, .signedOutFederatedTokensInvalid, .signedOutUserPoolsTokenInvalid:
        print("Signed Out")
      default: break
      }
    }
//    _ = Amplify.Auth.fetchAuthSession { result in
//      switch result {
//      case .success(let session):
//        print("Is user signed in - \(session.isSignedIn)")
//      case .failure(let error):
//        print("Fetch session failed with error \(error)")
//      }
//    }
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
    /// Login with Amplify.Auth
    Amplify.Auth.signInWithWebUI(for: .facebook,
                                 presentationAnchor: UIApplication.shared.windows.first!) { [weak self] result in
                                  switch result {
                                  case .success:
                                    print("Sign in succeeded")
                                    self?.getTokens()
                                  case .failure(let error):
                                    print("Sign in failed \(error)")
                                  }
    }
    
    /// Login with AWSMobileClient
//        let hostedUIOptions = HostedUIOptions(scopes: ["profile","email"], identityProvider: "Facebook")
//        AWSMobileClient.default().showSignIn(navigationController: self.navigationController!, hostedUIOptions: hostedUIOptions) { (userState, error) in
//            if let error = error as? AWSMobileClientError {
//                print(error.localizedDescription)
//            }
//            if let userState = userState {
//                print("Status: \(userState.rawValue)")
//            }
//        }

//
//    let cognitoRegion = AWSRegionType.USEast2 // Region of your Cognito Identity Pool
//    let cognitoIdentityPoolId = "us-east-2:511dd363-3756-425d-95a2-eb607ec3f542" // e.g. "us-east-1:111e111-8efa-dead-b8d7-11c7f4e00de1"
//    let tokens = ["graph.facebook.com": AccessToken.current!.tokenString]
//    let customIdentityProvider = CustomIdentityProvider(tokens: tokens)
//    let credentialsProvider = AWSCognitoCredentialsProvider(regionType: cognitoRegion,
//                                                            identityPoolId: cognitoIdentityPoolId,
//                                                            identityProviderManager: customIdentityProvider)
//    let configuration = AWSServiceConfiguration(region: cognitoRegion,
//                                                credentialsProvider: credentialsProvider)
//    AWSServiceManager.default().defaultServiceConfiguration = configuration
//    AWSCognitoIdentityProvider.register(with: configuration!, forKey: "identityProvider")
//
    
//    credentialsProvider.getIdentityId().continueWith { (task) -> Any? in
//      guard task.error != nil else {
//        print("Error: \(task.error?.localizedDescription)")
//        return nil
//      }
//      print("ClientId: \((task.result ?? "") as String)")
//      return task
//    }
  }
  
  private func getTokens() {
    AWSMobileClient.default().getIdentityId().continueWith { (task) in
      guard task.error == nil else {
        print("Error: \(task.error?.localizedDescription)")
        return nil
      }
      print("ClientId: \((task.result ?? "") as String)")
      return nil
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
          case .failure(_):
            print("Sign Out failed")
          }
        }
    
    /// SignOut with AWSMobileClient
//    AWSMobileClient.default().signOut()
    
//    AWSSignInManager.sharedInstance().logout(completionHandler: {(result: Any?, error: Error?) in
//      //self.showSignIn()
//      print("Sign-out Successful")
//    })
  }
  
  // MARK: - Facebook LoginButtonDelegate
  func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
    print("FBSDKLoginKit.AccessToken.current: \(FBSDKLoginKit.AccessToken.current)")
  }
  
  func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
    print("loginButtonDidLogOut")
  }
  
  
}
