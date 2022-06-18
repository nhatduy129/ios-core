//
//  PosterResponseDate.swift
//  60.AlamofireUnitTests
//
//  Created by Duy Nguyen on 27/7/21.
//

import Foundation

struct PosterResponseDate: Codable, Equatable {
    let maximum: Date?
    let minimum: Date?
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.maximum == rhs.maximum && lhs.minimum == rhs.minimum
    }
}
