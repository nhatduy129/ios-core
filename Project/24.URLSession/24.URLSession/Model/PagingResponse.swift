//
//  PagingResponse.swift
//  24.URLSession
//
//  Created by Duy Nguyen on 9/7/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

struct PagingResponse<T: Decodable>: Decodable {
    
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [T]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try? values.decode(Int.self, forKey: .page)
        totalResults = try? values.decode(Int.self, forKey: .totalResults)
        totalPages = try? values.decode(Int.self, forKey: .totalPages)
        results = try? values.decode([T].self, forKey: .results)
    }
}
