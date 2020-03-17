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
        URL(string: "http://www.sagamedia.vn/wp-content/uploads/van-khan-audio/vk_1/f1/vk001-01.mp3")!,
        URL(string: "http://www.sagamedia.vn/wp-content/uploads/van-khan-audio/vk_1/m1/vk001-01.mp3")!,
        URL(string: "http://www.sagamedia.vn/wp-content/uploads/van-khan-audio/vk_1/f1/vk001-03.mp3")!,
        URL(string: "http://www.sagamedia.vn/wp-content/uploads/van-khan-audio/vk_1/m1/vk001-03.mp3")!,
    ]
    var alert: UIAlertController?
    var downloadTask: URLSessionDownloadTask?
    var index: Int = 0
    lazy var session: URLSession = {
        return URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    }()
    
    @IBAction func downloadMultipleFilesButtonTapped(_ sender: Any) {
        self.index = 0
        self.downloadMultipleFiles()
        // Setup Alert
        alert = UIAlertController(title: "Downloading \(self.index) out of \(data.count) files", message: "Downloaded 0%", preferredStyle: .alert)
        alert?.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {[weak self]_ in
            self?.downloadTask?.cancel()
        }))
        self.present(alert!, animated: true)
    }
    
    func downloadMultipleFiles() {
        guard self.index < data.count else { return }
        self.downloadTask = self.session.downloadTask(with: data[self.index])
        self.downloadTask?.resume()
        self.index += 1
    }
}

extension SecondVC: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(location)
        DispatchQueue.main.async {[weak self] in
            guard let `self` = self else { return }
            self.alert?.title = "Downloading \(self.index) out of \(self.data.count) files"
        }
        self.downloadMultipleFiles()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress: Double = Double(totalBytesWritten) * 100 / Double(totalBytesExpectedToWrite)
        DispatchQueue.main.async {[weak self] in
            self?.alert?.message = "Downloaded \(Int(progress))%"
        }
        print("Downloaded \(Int(progress))%")
    }
}
