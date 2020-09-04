//
//  GoogleViewController.swift
//  50.AWSCognito
//
//  Created by Duy Nguyen on 3/9/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import Amplify
import AWSMobileClient

class GoogleViewController: UIViewController {
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchCurrentAuthSession()
  }
  
  func fetchCurrentAuthSession() {
    Amplify.Auth.fetchAuthSession { result in
      switch result {
      case .success(let session):
        print("Is user signed in - \(session.isSignedIn)")
      case .failure(let error):
        print("Fetch session failed with error \(error)")
      }
    }
  }
  
  @IBAction func login() {
    Amplify.Auth.signInWithWebUI(for: .google,
                                 presentationAnchor: UIApplication.shared.windows.first!) { [weak self] result in
                                  switch result {
                                  case .success:
                                    print("Sign in succeeded")
                                    self?.getTokens()
                                  case .failure(let error):
                                    print("Sign in failed \(error)")
                                  }
    }
  }
  
  @IBAction func logout() {
    /// Sign out with Amplify
    Amplify.Auth.signOut { (result) in
      switch result {
      case .success:
        print("Signed Out")
      case .failure(_):
        print("Sign Out failed")
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
  
}
