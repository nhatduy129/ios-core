//
//  FirstVC.swift
//  41.FileDownloader
//
//  Created by Duy Nguyen on 17/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

// Note: if your file is HTTP, you have to add "App Transport Security Settings", "Allow Arbitrary Loads" in Info.plist
class FirstVC: UIViewController {

    let data = URL(string: "http://www.sagamedia.vn/wp-content/uploads/van-khan-audio/vk-78.mp3")!
    //let data =  URL(string: "http://ipv4.download.thinkbroadband.com/50MB.zip")!
    var alert: UIAlertController?
    
    @IBAction func downloadSingleFileButtonTapped(_ sender: Any) {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        let downloadTask = session.downloadTask(with: data)
        downloadTask.resume()
        
        alert = UIAlertController(title: "Downloaded 0%", message: nil, preferredStyle: .alert)
        alert?.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {_ in
            downloadTask.cancel()
        }))
        self.present(alert!, animated: true, completion: nil)
    }
    
}

extension FirstVC: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64, totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {
        // Handle download progress
        let progress: Double = Double(totalBytesWritten) * 100 / Double(totalBytesExpectedToWrite)
        DispatchQueue.main.async {[weak self] in
            self?.alert?.title = "Downloaded \(Int(progress))%"
        }
        
        print("Downloaded \(Int(progress))%")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL) {
        // After download completed, change action from "Cancel" to "OK"
        DispatchQueue.main.async {[weak self] in
            self?.alert?.title = "Download completed"
            let alertAction = self?.alert?.actions.first
            alertAction?.setValue("OK", forKey: "title")
        }
        
        print(location)
        // Store file to local (document)
        if let data = try? Data(contentsOf: location) {
            let fileName = downloadTask.originalRequest?.url?.lastPathComponent ?? "unknown.mp3"
            Utils.storeFileLocally(fileName: fileName, data: data)
        }
    }
}
