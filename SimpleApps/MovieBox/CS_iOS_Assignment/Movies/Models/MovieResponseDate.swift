//
//  MovieResponseDate.swift
//  CS_iOS_Assignment
//
//  Created by Duy Nguyen on 28/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import Foundation

struct MovieResponseDate: Codable, Equatable {
    let maximum: Date?
    let minimum: Date?
}
