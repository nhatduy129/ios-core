//
//  APIHelper.swift
//  24.URLSession
//
//  Created by Duy Nguyen on 9/7/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

class APIHelper {
    
    static func getListBooks(completed: ()) {
        var request = URLRequest(url: URL(string: "https://storage.googleapis.com/carousell-interview-assets/ios/ios-sse-1a.json")!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            if error != nil {
                
            }
        }
        task.resume()
    }
}
