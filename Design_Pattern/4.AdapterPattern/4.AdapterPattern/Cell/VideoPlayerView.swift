//
//  VideoPlayerView.swift
//  4.AdapterPattern
//
//  Created by Duy Nguyen on 16/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class VideoPlayerView: UIView {
    
    private var videoPlayButton: UIButton
    var videoURL: URL
    
    init(frame: CGRect, videoURL: URL) {
        self.videoURL = videoURL
        videoPlayButton = UIButton()
        super.init(frame: frame)
        videoPlayButton.setTitle("Video Play", for: .normal)
        videoPlayButton.setTitleColor(.blue, for: .normal)
        videoPlayButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.addSubview(videoPlayButton)
        videoPlayButton.translatesAutoresizingMaskIntoConstraints = false
        videoPlayButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        videoPlayButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        videoPlayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        videoPlayButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped() {
        print("Video Play: \(videoURL.absoluteString)")
    }
}
