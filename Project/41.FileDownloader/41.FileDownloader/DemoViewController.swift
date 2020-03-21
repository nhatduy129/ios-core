//
//  DemoViewController.swift
//  41.FileDownloader
//
//  Created by Duy Nguyen on 17/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func downloadButtonTapped(_ sender: UIButton) {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        let downloadTask = session.downloadTask(with: URL(string: "http://ipv4.download.thinkbroadband.com/80MB.zip")!)
        downloadTask.resume()
    }
}

extension DemoViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print("")
    }
}
