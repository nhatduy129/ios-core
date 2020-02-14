//
//  ViewController.swift
//  YoutubePlayer
//
//  Created by Duy Nguyen on 14/2/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import XCDYouTubeKit
import AVKit

class ViewController: UIViewController {

    weak var playerViewController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupController()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayerViewControllerSegue" {
            self.playerViewController = (segue.destination as! AVPlayerViewController)
        }
    }
    
    private func setupController() {
        let id = "jPgv65WW9XI"
        XCDYouTubeClient.default().getVideoWithIdentifier(id, completionHandler: {[weak self] video, error in
            guard let `self` = self else { return }
            guard let video = video else {
                print(error?.localizedDescription ?? "")
                return
            }
            let streamURL = video.streamURL
            self.playerViewController.player = AVPlayer(url: streamURL)
            self.playerViewController.player?.play()
            
        })
    }

    @IBAction func moveToButtonTapped(_ sender: Any) {
        // Move forward 1 min
        let cmTime = CMTime(seconds: 60, preferredTimescale: 1)
        self.playerViewController.player?.seek(to: cmTime)
    }
}

