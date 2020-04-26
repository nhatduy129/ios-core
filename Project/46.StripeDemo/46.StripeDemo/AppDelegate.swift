//
//  AppDelegate.swift
//  46.StripeDemo
//
//  Created by Duy Nguyen on 19/4/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import Stripe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Stripe.setDefaultPublishableKey("pk_test_mXQeonZBi7zN51PU6SZh8PAW00AkqAWOsa")
        return true
    }
}

