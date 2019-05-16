//
//  AudioPlayerView.swift
//  4.AdapterPattern
//
//  Created by Duy Nguyen on 16/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class AudioPlayerView: UIView {

    private var audioPlayButton: UIButton
    var audioURL: URL
    
    init(frame: CGRect, audioURL: URL) {
        self.audioURL = audioURL
        audioPlayButton = UIButton()
        super.init(frame: frame)
        audioPlayButton.setTitle("Audio Play", for: .normal)
        audioPlayButton.setTitleColor(.blue, for: .normal)
        audioPlayButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.addSubview(audioPlayButton)
        audioPlayButton.translatesAutoresizingMaskIntoConstraints = false
        audioPlayButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        audioPlayButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        audioPlayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        audioPlayButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped() {
        print("Audio Play: \(audioURL.absoluteString)")
    }
}
