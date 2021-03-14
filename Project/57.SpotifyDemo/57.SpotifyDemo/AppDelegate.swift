//
//  AppDelegate.swift
//  57.SpotifyDemo
//
//  Created by Duy Nguyen on 14/3/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var auth = SPTAuth()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(identifier: "ViewController")
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        auth.redirectURL     = URL(string: "spotify-demo://returnAfterLogin")
        auth.sessionUserDefaultsKey = "current session"
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        // called when user signs into spotify. Session data saved into user defaults, then notification posted to call updateAfterFirstLogin in ViewController.swift. Modeled off recommneded auth flow suggested by Spotify documentation
        if auth.canHandle(auth.redirectURL) {
            auth.handleAuthCallback(withTriggeredAuthURL: url, callback: { (error, session) in
                guard error == nil, let session = session,
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
}

