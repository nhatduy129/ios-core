//
//  SecondVC.swift
//  41.FileDownloader
//
//  Created by Duy Nguyen on 17/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

// Note: if your file is HTTP, you have to add "App Transport Security Settings", "Allow Arbitrary Loads" in Info.plist
class SecondVC: UIViewController {
    
    let data = [
        URL(string: "http://www.sagamedia.vn/wp-content/uploads/van-khan-audio/vk-78.mp3")!,
        URL(string: "http://www.sagamedia.vn/wp-content/uploads/van-khan-audio/vk_078/f1/vk078-01.mp3")!,
        URL(string: "http://www.sagamedia.vn/wp-content/uploads/van-khan-audio/vk_078/m1/vk078-01.mp3")!,
    ]

    @IBAction func downloadMultipleFilesButtonTapped(_ sender: Any) {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        session.downloadTask(with: data[0]).resume()
    }
}

extension SecondVC: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(location)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress: Double = Double(totalBytesWritten) * 100 / Double(totalBytesExpectedToWrite)
        print("Downloaded \(Int(progress))%")
    }
}
