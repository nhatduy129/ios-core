//
//  MovieCellTests.swift
//  MovieBoxTests
//
//  Created by Duy Nguyen on 31/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import XCTest
@testable import MovieBox

final class MovieCellTests: XCTestCase {
    var sut: MovieCell!
    
    override func setUp() {
        super.setUp()
        sut = MovieCell()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_assignMovie() {
        // given
        let movie = Movie(adult: nil, backdropPath: nil,
                          genreIds: nil, id: 11,
                          originalLanguage: nil, originalTitle: nil,
                          overview: nil, popularity: nil,
                          posterPath: nil, releaseDate: nil,
                          title: nil, video: nil,
                          voteAverage: nil, voteCount: nil)
        // when
        sut.movie = movie
        // then
        XCTAssertEqual(sut.titleLabel.text, movie.title)
        XCTAssertEqual(sut.releaseDateLabel.text, movie.releaseDate?.toString(format: "MMMM d, yyyy"))
        XCTAssertEqual(sut.originalLanguageLabel.text, movie.originalLanguage)
        XCTAssertEqual(sut.ratingView.rating, movie.voteAverage)
    }
}
