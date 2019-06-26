//
//  AppDelegate.swift
//  23.UIProgramming
//
//  Created by Duy Nguyen on 26/6/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc1 = FirstVC()
        let vc2 = SecondVC()
        let vc3 = ThirdVC()
        let navController1 = UINavigationController(rootViewController: vc1)
        navController1.title = "Frist"
        vc2.title = "Second"
        vc3.title = "Third"
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navController1, vc2, vc3]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

