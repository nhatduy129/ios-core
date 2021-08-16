//
//  ConstantsTests.swift
//  MovieBoxTests
//
//  Created by Duy Nguyen on 28/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import XCTest
@testable import MovieBox

final class ConstantsTests: XCTestCase {
    func testConstants_baseURL() {
        let expected = "https://api.themoviedb.org/3"
        let result = Constants.baseURL
        XCTAssertEqual(result, expected)
    }
    
    func testConstants_apiKey() {
        let expected = "55957fcf3ba81b137f8fc01ac5a31fb5"
        let result = Constants.apiKey
        XCTAssertEqual(result, expected)
    }
    
    func testConstants_baseImageURL() {
        let expected = "https://image.tmdb.org/t/p"
        let result = Constants.baseImageURL
        XCTAssertEqual(result, expected)
    }
}
