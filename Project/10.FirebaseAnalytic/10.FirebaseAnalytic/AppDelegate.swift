//
//  AppDelegate.swift
//  10.FirebaseAnalytic
//
//  Created by Duy Nguyen on 29/4/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        
        return true
    }
}

