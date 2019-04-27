//
//  ViewController.swift
//  8.RewardedVideoAds
//
//  Created by Duy Nguyen on 26/4/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    var rewardBaseVideo: GADRewardBasedVideoAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rewardBaseVideo = GADRewardBasedVideoAd.sharedInstance()
        rewardBaseVideo?.delegate = self
        rewardBaseVideo?.load(GADRequest(),
                             withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
    }
    
    @IBAction func displayVideoAdsButtonTapped(_ button: UIButton) {
        if rewardBaseVideo?.isReady == true {
            rewardBaseVideo?.present(fromRootViewController: self)
        }
    }
}

extension ViewController: GADRewardBasedVideoAdDelegate {
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        print("didRewardUserWith")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidReceive")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidClose")
        rewardBaseVideo?.load(GADRequest(), withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
    }
}

