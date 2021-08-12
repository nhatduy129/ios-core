//
//  MovieTests.swift
//  CS_iOS_AssignmentTests
//
//  Created by Duy Nguyen on 29/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import XCTest
@testable import CS_iOS_Assignment

final class MovieTests: XCTestCase {
    private func givenMovie(posterPath: String?) -> Movie {
        return Movie(adult: nil, backdropPath: nil,
                      genreIds: nil, id: 1, originalLanguage: nil,
                      originalTitle: nil, overview: nil,
                      popularity: nil, posterPath: posterPath,
                      releaseDate: nil, title: nil,
                      video: nil, voteAverage: nil,
                      voteCount: nil)
    }
    
    func testPoster_getPosterThumbnailURL_success() {
        // given
        let poster = givenMovie(posterPath: "/abc.png")
        // when
        let result = poster.getPosterThumbnailURL()
        // then
        XCTAssertEqual(result?.absoluteString, "\(Constants.baseImageURL)/w185\(poster.posterPath ?? "")")
    }
    
    func testPoster_getPosterThumbnailURL_posterPathNilReturnNil() {
        // given
        let poster = givenMovie(posterPath: nil)
        // when
        let result = poster.getPosterThumbnailURL()
        // then
        XCTAssertNil(result)
    }
    
    func testPoster_getPosterURL_success() {
        // given
        let poster = givenMovie(posterPath: "/abc.png")
        // when
        let result = poster.getPosterURL()
        // then
        XCTAssertEqual(result?.absoluteString, "\(Constants.baseImageURL)/w300\(poster.posterPath ?? "")")
    }
    
    func testPoster_getPosterURL_posterPathNilReturnNil() {
        // given
        let poster = givenMovie(posterPath: nil)
        // when
        let result = poster.getPosterURL()
        // then
        XCTAssertNil(result)
    }
}
