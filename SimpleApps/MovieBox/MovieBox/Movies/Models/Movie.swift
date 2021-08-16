//
//  Movie.swift
//  MovieBox
//
//  Created by Duy Nguyen on 28/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import Foundation

struct Movie: Codable, Equatable {
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let id: Int
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: Date?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func getPosterThumbnailURL() -> URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "\(Constants.baseImageURL)/w185\(posterPath)")
    }
    
    func getPosterURL() -> URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "\(Constants.baseImageURL)/w300\(posterPath)")
    }
}
