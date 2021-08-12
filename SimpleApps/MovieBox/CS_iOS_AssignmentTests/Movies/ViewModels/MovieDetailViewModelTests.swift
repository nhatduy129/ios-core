//
//  MovieDetailViewModelTests.swift
//  CS_iOS_AssignmentTests
//
//  Created by Duy Nguyen on 31/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import XCTest
@testable import CS_iOS_Assignment

final class MovieDetailViewModelTests: XCTestCase {
    var sut: MovieDetailViewModel!
    
    override func setUp() {
        super.setUp()
        let movieDetail = givenMovie(runtime: 123)
        sut = MovieDetailViewModel(movieDetail: movieDetail)
    }
    
    private func givenMovie(runtime: Int?) -> MovieDetail {
        return MovieDetail(adult: nil, backdropPath: nil, budget: nil,
                           genres: [Genre(id: 10, name: "a"),
                                    Genre(id: 11, name: "b")],
                           homepage: nil, id: 10, imdbID: nil,
                           originalLanguage: nil, originalTitle: nil, overview: "xyz",
                           popularity: nil, posterPath: "/nil",
                           releaseDate: Date(dateString: "2020-02-20",
                                             format: "yyyy-MM-dd"),
                           revenue: nil, runtime: runtime,
                           status: nil, tagline: nil, title: "abc",
                           video: nil, voteAverage: nil, voteCount: nil)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testMovieDetailViewModel_getTitle() {
        XCTAssertEqual(sut.getTitle(), "abc")
    }
    
    func testMovieDetailViewModel_getReleaseDateAndRuntime() {
        XCTAssertEqual(sut.getReleaseDateAndRuntime(), "February 20, 2020  -  2h 3m")
    }
    
    func testMovieDetailViewModel_getReleaseDateAndRuntime_runtimeLessThanAMinute() {
        // given
        let movieDetail = givenMovie(runtime: 50)
        let sut = MovieDetailViewModel(movieDetail: movieDetail)
        // when
        let result = sut.getReleaseDateAndRuntime()
        // then
        XCTAssertEqual(result, "February 20, 2020  -  50m")
    }
    
    func testMovieDetailViewModel_getOverView() {
        XCTAssertEqual(sut.getOverview(), "xyz")
    }
    
    func testMovieDetailViewModel_getPosterURL() {
        XCTAssertEqual(sut.getPosterURL(), URL(string: "\(Constants.baseImageURL)/w300/nil"))
    }
    
    func testMovieDetailViewModel_getNumberOfGenres() {
        XCTAssertEqual(sut.getNumberOfGenres(), 2)
    }
    
    func testMovieDetailViewModel_getGenre() {
        XCTAssertEqual(sut.getGenre(byIndex: 1)?.id, 11)
    }
}
