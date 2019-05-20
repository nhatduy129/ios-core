//
//  AppDelegate.swift
//  16.InstumentLeakDemo
//
//  Created by Duy Nguyen on 20/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = UINavigationController(rootViewController: FirstVC())
        return true
    }
}

