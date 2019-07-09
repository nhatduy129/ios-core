//
//  Movie.swift
//  24.URLSession
//
//  Created by Duy Nguyen on 9/7/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    var id: Int?
    var title: String?
    var originalLanguage: String?
    private var posterPath: String?
    var overview: String?
    var releaseDate: Date?
    var genreIds: [Int]?
    var voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalLanguage = "original_language"
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case voteAverage = "vote_average"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? values.decode(Int.self, forKey: .id)
        title = try? values.decode(String.self, forKey: .title)
        originalLanguage = try? values.decode(String.self, forKey: .originalLanguage)
        posterPath = try? values.decode(String.self, forKey: .posterPath)
        overview = try? values.decode(String.self, forKey: .overview)
        //let releaseDate = try? values.decode(String.self, forKey: .releaseDate)
        genreIds = try? values.decode([Int].self, forKey: .genreIds)
        voteAverage = try? values.decode(Double.self, forKey: .voteAverage)
        
        //self.releaseDate = releaseDate?.date(format: "yyyy-MM-dd")
    }
}
