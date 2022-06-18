//
//  PosterResponse.swift
//  60.AlamofireUnitTests
//
//  Created by Duy Nguyen on 27/7/21.
//

import Foundation

struct PosterResponse: Codable, Equatable {
    let date: PosterResponseDate?
    let page: Int
    let results: [Poster]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case date
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        let dateCondition = lhs.date == rhs.date
        let pageCondition = lhs.page == rhs.page
        let totalPagesCodition = lhs.totalPages == rhs.totalPages
        let totalResultsCondition = lhs.totalResults == rhs.totalResults
        let resultsCondition = lhs.results == rhs.results
        return dateCondition && pageCondition && totalPagesCodition && totalResultsCondition && resultsCondition
    }
}
