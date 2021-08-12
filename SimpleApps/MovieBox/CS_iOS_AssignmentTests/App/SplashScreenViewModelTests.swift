//
//  SplashScreenViewModelTests.swift
//  CS_iOS_AssignmentTests
//
//  Created by Duy Nguyen on 1/8/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import XCTest
import Mocker
@testable import CS_iOS_Assignment

final class SplashScreenViewModelTests: XCTestCase {
    var sut: SplashScreenViewModel!
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let mockSession = MockSession(configuration: configuration)
        let networkManager = NetworkManager(sessionManager: mockSession)
        sut = SplashScreenViewModel(networkManager: networkManager)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    private func getMovie(id: Int) -> Movie {
        return Movie(adult: nil, backdropPath: nil,
                     genreIds: nil, id: id,
                     originalLanguage: nil, originalTitle: nil,
                     overview: nil, popularity: nil,
                     posterPath: nil, releaseDate: nil,
                     title: nil, video: nil,
                     voteAverage: nil, voteCount: nil)
    }
    
    private func givenTwoMovies() {
        let movies = [getMovie(id: 10),
                      getMovie(id: 11)]
        let movieResponse = MovieResponse(date: nil, page: 1,
                                          results: movies, totalPages: 1,
                                          totalResults: 2)
        let mockedData = try? JSONEncoder().encode(movieResponse)
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/popular?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=1")!,
                        dataType: .json, statusCode: 200,
                        data: [.get: mockedData ?? Data()])
        mock.register()
    }
    
    private func givenThreePosters() {
        let posters = [getMovie(id: 20),
                       getMovie(id: 21),
                       getMovie(id: 22)]
        let movieResponse = MovieResponse(date: nil, page: 1,
                                          results: posters, totalPages: 1,
                                          totalResults: 2)
        let mockedData = try? JSONEncoder().encode(movieResponse)
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/now_playing?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=undefined")!,
                        dataType: .json, statusCode: 200,
                        data: [.get: mockedData ?? Data()])
        mock.register()
    }
    
    private func givenMoviesFail() {
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/popular?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=1")!,
                        dataType: .json, statusCode: 401,
                        data: [.get: Data()])
        mock.register()
    }
    
    private func givenPostersFail() {
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/now_playing?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=undefined")!,
                        dataType: .json, statusCode: 401,
                        data: [.get: Data()])
        mock.register()
    }
    
    func test_fetchMoviesAndPosters_success() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        givenTwoMovies()
        givenThreePosters()
        // when
        var result: (movies: [Movie], posters: [Movie])?
        sut.fetchMoviesAndPosters { res in
            result = try? res.get()
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.movies.count, 2)
        XCTAssertEqual(result?.posters.count, 3)
    }
    
    func test_fetchMoviesAndPosters_fetchMoviesSuccessButPosterFail_returnError() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        givenTwoMovies()
        givenPostersFail()
        // when
        var error: Error?
        sut.fetchMoviesAndPosters { res in
            switch res {
            case .success(_):
                break
            case .failure(let err):
                error = err
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertNotNil(error)
    }
    
    func test_fetchMoviesAndPosters_fetchPostersSuccessButMoviesFail_returnError() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        givenMoviesFail()
        givenThreePosters()
        // when
        var error: Error?
        sut.fetchMoviesAndPosters { res in
            switch res {
            case .success(_):
                break
            case .failure(let err):
                error = err
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertNotNil(error)
    }
    
    func test_fetchMoviesAndPosters_fetchBothMoviesPosterFail_returnError() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        givenMoviesFail()
        givenPostersFail()
        // when
        var error: Error?
        sut.fetchMoviesAndPosters { res in
            switch res {
            case .success(_):
                break
            case .failure(let err):
                error = err
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertNotNil(error)
    }
}
