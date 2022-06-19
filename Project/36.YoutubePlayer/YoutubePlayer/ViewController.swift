//
//  ViewController.swift
//  YoutubePlayer
//
//  Created by Duy Nguyen on 14/2/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import XCDYouTubeKit_kbexdev
import AVKit

class ViewController: UIViewController {

    weak var playerViewController: AVPlayerViewController!
    fileprivate let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
    var imageUpdated: Bool = false // You need something like this to not load image every second
    
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
        setupRemoteTransportControls()
        playerViewController.updatesNowPlayingInfoCenter = false
        let id = "jPgv65WW9XI"
        XCDYouTubeClient.default().getVideoWithIdentifier(id, completionHandler: {[weak self] video, error in
            guard let self = self else { return }
            guard let video = video else {
                print(error?.localizedDescription ?? "")
                return
            }
            let streamURL = video.streamURL
            self.playerViewController.player = AVPlayer(url: streamURL!)
            self.playerViewController.player?.play()
            self.playerViewController.player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1,
                                                                                          preferredTimescale: CMTimeScale(1000)),
                                                                      queue: DispatchQueue.main,
                                                                      using: { newTime in
                self.updateNowPlayingInfo(video, currentTime: newTime)
            })
            self.setupBackgroundAudio()
            self.updateNowPlayingInfo(video)
        })
    }
    
    private func setupBackgroundAudio(){
        do {
            try AVAudioSession.sharedInstance()
                .setCategory(AVAudioSession.Category.playback)
            do {
                UIApplication.shared.beginReceivingRemoteControlEvents()
                try AVAudioSession.sharedInstance().setActive(true)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    private func updateNowPlayingInfo(_ video: XCDYouTubeVideo, currentTime: CMTime? = nil) {
        guard let player = playerViewController.player else {
            return
        }
        var nowPlayingInfo = nowPlayingInfoCenter.nowPlayingInfo ?? [String: Any]()
        if !imageUpdated, let thumbnailURL = video.thumbnailURLs?.first {
            URLSession.shared.dataTask(with: thumbnailURL) { (data, _, error) in
                guard error == nil else { return }
                guard data != nil else { return }
                guard let image = UIImage(data: data!) else { return }
                let artwork = MPMediaItemArtwork(boundsSize: image.size) { _ in
                    return image
                }
                nowPlayingInfo[MPMediaItemPropertyArtwork] = artwork
                self.imageUpdated = true
            }.resume()
        }
        nowPlayingInfo[MPNowPlayingInfoPropertyMediaType] = NSNumber(value: MPNowPlayingInfoMediaType.video.rawValue)
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = CMTimeGetSeconds(player.currentTime())
        if let currentItem = player.currentItem {
            nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = CMTimeGetSeconds(currentItem.asset.duration)
        }
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = player.rate
        nowPlayingInfo[MPMediaItemPropertyTitle] = video.title
        nowPlayingInfo[MPMediaItemPropertyArtist] = video.author
        nowPlayingInfoCenter.nowPlayingInfo = nowPlayingInfo
    }
    
    private func setupRemoteTransportControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget { [unowned self] event in
            self.playerViewController.player?.play()
            return .success
        }
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            self.playerViewController.player?.pause()
            return .success
        }
        commandCenter.skipForwardCommand.preferredIntervals = [10]
        commandCenter.skipForwardCommand.addTarget { [unowned self] event in
            self.moveForward(seconds: 10)
            return .success
        }
        commandCenter.skipBackwardCommand.preferredIntervals = [10]
        commandCenter.skipBackwardCommand.addTarget { [unowned self] event in
            self.moveBackward(seconds: 10)
            return .success
        }
        commandCenter.changePlaybackPositionCommand.addTarget { [weak self] event in
            if let event = event as? MPChangePlaybackPositionCommandEvent {
                self?.playerViewController.player?.seek(to: CMTime(seconds: event.positionTime,
                                                                   preferredTimescale: CMTimeScale(1000)))
            }
            return .success
        }
    }
    
    private func moveBackward(seconds: Double) {
        guard let player = playerViewController.player else { return }
        let newTime = CMTimeMakeWithSeconds(CMTimeGetSeconds(player.currentTime()) - seconds,
                                            preferredTimescale: player.currentTime().timescale)
        player.seek(to: newTime)
    }
    
    private func moveForward(seconds: Double) {
        guard let player = playerViewController.player else { return }
        let newTime = CMTimeMakeWithSeconds(CMTimeGetSeconds(player.currentTime()) + seconds,
                                            preferredTimescale: player.currentTime().timescale)
        player.seek(to: newTime)
    }
    
    @IBAction func moveToButtonTapped(_ sender: Any) {
        moveForward(seconds: 60)
    }
}
