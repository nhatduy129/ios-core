//
//  MoviesListViewModelTests.swift
//  CS_iOS_AssignmentTests
//
//  Created by Duy Nguyen on 30/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import XCTest
import Alamofire
import Mocker
@testable import CS_iOS_Assignment

// swiftlint:disable force_try
final class MoviesListViewModelTests: XCTestCase {
    private var sut: MoviesListViewModel!
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let mockSession = MockSession(configuration: configuration)
        let networkManager = NetworkManager(sessionManager: mockSession)
        sut = MoviesListViewModel(movies: [givenMovie(id: 100),
                                           givenMovie(id: 101)],
                                  poster: [givenMovie(id: 9)],
                                  networkManager: networkManager)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Given
    private func givenMovie(id: Int) -> Movie {
        return Movie(adult: nil, backdropPath: nil,
                     genreIds: nil, id: id,
                     originalLanguage: nil, originalTitle: nil,
                     overview: nil, popularity: nil,
                     posterPath: nil, releaseDate: nil,
                     title: nil, video: nil,
                     voteAverage: nil, voteCount: nil)
    }
    
    private func givenMovieResponse() -> MovieResponse {
        return MovieResponse(date: nil, page: 2,
                             results: [givenMovie(id: 1000),
                                       givenMovie(id: 1001)],
                             totalPages: 10, totalResults: 2)
    }
    
    func testMoviesListViewModel_getNumberOfMovies() {
        XCTAssertEqual(sut.getNumberOfMovies(), 2)
    }
    
    func testMoviesListViewModel_getMovie() {
        XCTAssertEqual(sut.getMovie(byIndex: 1).id, 101)
    }
    
    func testMoviesListViewModel_getNumberOfPoster() {
        XCTAssertEqual(sut.getNumberOfPoster(), 1)
    }
    
    func testMoviesListViewModel_getPoster() {
        XCTAssertEqual(sut.getPoster(byIndex: 0).id, 9)
    }
    
    func testMoviesListViewModel_loadMoreMovies_success() {
        // given
        let mockData = try! JSONEncoder().encode(givenMovieResponse())
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/popular?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=2")!,
                        dataType: .json, statusCode: 200,
                        data: [.get: mockData])
        mock.register()
        let promise = expectation(description: "Completion handler invoked")
        // when
        sut.loadMoreMovies {_ in
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(sut.getNumberOfMovies(), 4)
        XCTAssertEqual(sut.getMovie(byIndex: 2).id, 1000)
    }
    
    func testMoviesListViewModel_loadMoreMovies_fail() {
        // given
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/popular?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=2")!,
                        dataType: .json, statusCode: 401,
                        data: [.get: Data()])
        mock.register()
        let promise = expectation(description: "Completion handler invoked")
        // when
        var error: AFError?
        sut.loadMoreMovies { result in
            switch result {
            case .failure(let err):
                error = err
            case .success:
                break
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertNotNil(error)
        XCTAssertEqual(sut.getNumberOfMovies(), 2)
    }
}
