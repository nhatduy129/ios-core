//
//  ViewController.swift
//  57.SpotifyDemo
//
//  Created by Duy Nguyen on 14/3/21.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SPTAudioStreamingPlaybackDelegate, SPTAudioStreamingDelegate {
    let auth = SPTAuth.defaultInstance()!
    var session: SPTSession?
    var player: SPTAudioStreamingController?
    var loginUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateAfterFirstLogin),
                                               name: NSNotification.Name(rawValue: "loginSuccessfull"), object: nil)

    }
    
    private func setup() {
        auth.redirectURL = URL(string: "spotify-demo://returnAfterLogin")
        auth.clientID = "256754754a974b9dbe7013e366ba564f"
        auth.requestedScopes = [SPTAuthStreamingScope,
                                SPTAuthPlaylistReadPrivateScope,
                                SPTAuthPlaylistModifyPublicScope,
                                SPTAuthPlaylistModifyPrivateScope]
        loginUrl = auth.spotifyWebAuthenticationURL()
    }
    
    private func initializePlayer(authSession: SPTSession) {
        guard player == nil else { return }
        player = SPTAudioStreamingController.sharedInstance()
        player!.playbackDelegate = self
        player!.delegate = self
        try? player!.start(withClientId: auth.clientID)
        player!.login(withAccessToken: authSession.accessToken)
    }
    
    
    @objc private func updateAfterFirstLogin() {
        let userDefaults = UserDefaults.standard
        if let sessionObj: AnyObject = userDefaults.object(forKey: "SpotifySession") as AnyObject?,
           let sessionDataObj = sessionObj as? Data,
           let firstTimeSession = try? NSKeyedUnarchiver.unarchivedObject(ofClass: SPTSession.self,
                                                                          from: sessionDataObj) {
            session = firstTimeSession
            initializePlayer(authSession: session!)
        }
    }
    
    func audioStreamingDidLogin(_ audioStreaming: SPTAudioStreamingController!) {
        print("logged in")
    }
    
    @IBAction private func loginButtonTapped(_ sender: UIButton) {
        if let loginUrl = loginUrl, UIApplication.shared.canOpenURL(loginUrl) {
            UIApplication.shared.open(loginUrl, options: [:]) {[weak self] success in
                guard let self = self else { return }
                if success == true, self.auth.canHandle(self.auth.redirectURL) == true {
                    print("to do something")
                }
            }
        }
    }
}
