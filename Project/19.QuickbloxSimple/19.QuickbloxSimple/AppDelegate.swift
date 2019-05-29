//
//  AppDelegate.swift
//  19.QuickbloxSimple
//
//  Created by Duy Nguyen on 28/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import Quickblox

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupQuickblox()
        return true
    }
    
    func setupQuickblox() {
        QBSettings.applicationID = 77168
        QBSettings.authKey       = "bk8bvYhdspx5nbc"
        QBSettings.authSecret    = "en7Znvr4JfzMeZE"
        QBSettings.accountKey    = "JTq4Y2S_s6zRx6VgRqjH"
    }
}

