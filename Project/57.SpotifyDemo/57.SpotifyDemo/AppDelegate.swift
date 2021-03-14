//
//  AppDelegate.swift
//  57.SpotifyDemo
//
//  Created by Duy Nguyen on 14/3/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var auth = SPTAuth()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        auth.redirectURL     = URL(string: "spotify-demo://returnAfterLogin")
        auth.sessionUserDefaultsKey = "current session"
        return true
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        // called when user signs into spotify. Session data saved into user defaults, then notification posted to call updateAfterFirstLogin in ViewController.swift. Modeled off recommneded auth flow suggested by Spotify documentation
        if auth.canHandle(auth.redirectURL) {
            auth.handleAuthCallback(withTriggeredAuthURL: url, callback: { (error, session) in
                guard error != nil, let session = session,
                      let sessionData = try? NSKeyedArchiver.archivedData(withRootObject: session, requiringSecureCoding: true) else {
                    debugPrint(error!.localizedDescription)
                    return
                }
                let userDefaults = UserDefaults.standard
                debugPrint(sessionData)
                userDefaults.set(sessionData, forKey: "SpotifySession")
                userDefaults.synchronize()
                NotificationCenter.default.post(name: Notification.Name(rawValue: "loginSuccessfull"), object: nil)
            })
            return true
        }
        return false
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

