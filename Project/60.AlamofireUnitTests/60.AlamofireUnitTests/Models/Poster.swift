//
//  Poster.swift
//  60.AlamofireUnitTests
//
//  Created by Duy Nguyen on 27/7/21.
//

import Foundation

struct Poster: Codable, Equatable {
    let id: Int
    let posterPath: URL?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
