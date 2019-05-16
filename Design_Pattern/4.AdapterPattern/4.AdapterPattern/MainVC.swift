//
//  ViewController.swift
//  4.AdapterPattern
//
//  Created by Duy Nguyen on 16/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [
        Advice(title: "Cannot go any where.", audioUrl: nil, videoUrl: nil),
        Advice(title: "Please listen to me, you have to eat banana as many as possible.", audioUrl: nil, videoUrl: nil),
        Advice(title: "Stop talking.", audioUrl: URL(string: "http://howcanspeak.com"), videoUrl: nil),
        Advice(title: "Never stop.", audioUrl: nil, videoUrl: nil),
        Advice(title: "I have many things need to do.", audioUrl: URL(string: "http://howcanwrite.com"), videoUrl: nil),
        Advice(title: "Play football every weekend then everything will be fined.", audioUrl: nil, videoUrl: nil),
        Advice(title: "Play football every weekend then everything will be fined.", audioUrl: nil, videoUrl: URL(string: "http://youtube.com")),
        Advice(title: "Play football every weekend then everything will be fined.", audioUrl: nil, videoUrl: nil),
        Advice(title: "Play football every weekend then everything will be fined.", audioUrl: nil, videoUrl: nil),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AdviceCell.self, forCellReuseIdentifier: "\(AdviceCell.self)")
        tableView.register(AdviceAdapterCell.self, forCellReuseIdentifier: "\(AdviceAdapterCell.self)")
    }
}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let advice = data[indexPath.row]
        var cell: AdviceCell
        if let audioUrl = advice.audioUrl {
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AdviceAdapterCell.self)") as! AdviceAdapterCell
            let audioPlayer = AudioPlayerView(frame: CGRect(x: 0, y: 0, width: 100, height: 20), audioURL: audioUrl)
            cell.advice = advice
            (cell as! AdviceAdapterCell).setAdapter(player: audioPlayer)
        } else if let videoUrl = advice.videoUrl {
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AdviceAdapterCell.self)") as! AdviceAdapterCell
            let videoPlayer = VideoPlayerView(frame: CGRect(x: 0, y: 0, width: 100, height: 20), videoURL: videoUrl)
            cell.advice = advice
            (cell as! AdviceAdapterCell).setAdapter(player: videoPlayer)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AdviceCell.self)") as! AdviceCell
            cell.advice = advice
        }
        return cell
    }
}
