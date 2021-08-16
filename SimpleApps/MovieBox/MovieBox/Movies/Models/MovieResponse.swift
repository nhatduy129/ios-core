//
//  MovieResponse.swift
//  MovieBox
//
//  Created by Duy Nguyen on 28/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import Foundation

struct MovieResponse: Codable, Equatable {
    let date: MovieResponseDate?
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case date
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
