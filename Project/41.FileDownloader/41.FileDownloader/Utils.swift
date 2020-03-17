//
//  Utils.swift
//  41.FileDownloader
//
//  Created by Duy Nguyen on 17/3/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Foundation

class Utils {
    
    static func storeFileLocally(fileName: String, data: Data) {
        // create document folder url
        let documentsUrl: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        // create destination file url
        let destinationUrl: URL = documentsUrl.appendingPathComponent(fileName)
        // Start to store the file
        do {
            try data.write(to: destinationUrl)
            print("Save file succesfully.")
        } catch {
            print("Cannot write this file.")
        }
    }
}
