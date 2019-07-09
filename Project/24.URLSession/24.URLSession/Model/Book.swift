//
//  Book.swift
//  24.URLSession
//
//  Created by Duy Nguyen on 9/7/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

struct Book: Decodable {
    var content: String?
    var imageURL: URL?
    var username: String?
    var timestamp: String?
    
    enum CodingKeys: String, CodingKey {
        case content
        case imageURL = "image_url"
        case username
        case timestamp
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        content = try? values.decode(String.self, forKey: .content)
        imageURL = try? values.decode(URL.self, forKey: .imageURL)
        username = try? values.decode(String.self, forKey: .username)
        timestamp = try? values.decode(String.self, forKey: .timestamp)
        //If don't want to decode to optional, use "try" instead "try?"
    }
}
