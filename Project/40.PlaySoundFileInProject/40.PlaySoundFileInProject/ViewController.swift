//
//  ViewController.swift
//  40.PlaySoundFileInProject
//
//  Created by Duy Nguyen on 15/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

// Lưu ý, để đọc được file từ project thì cũng cần phải adđ file vào Build Phases/Copy Bundle Resources
class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        guard let sound = Bundle.main.url(forResource: "abc", withExtension: "m4a", subdirectory: "test1/f1") else {
            print("File not found")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound)
            audioPlayer.play()
        } catch {
            print("loi")
        }
    }
}

