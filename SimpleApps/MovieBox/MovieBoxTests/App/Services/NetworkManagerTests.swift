//
//  NetworkManagerTests.swift
//  MovieBoxTests
//
//  Created by Duy Nguyen on 28/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import XCTest
import Alamofire
import Mocker
@testable import MovieBox

// swiftlint:disable type_body_length
final class NetworkManagerTests: XCTestCase {
    var sut: NetworkManager!
    var mockSession: MockSession!
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        mockSession = MockSession(configuration: configuration)
        sut = NetworkManager(sessionManager: mockSession)
    }
    
    override func tearDown() {
        mockSession = nil
        sut = nil
        super.tearDown()
    }
    
    private func getEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        encoder.dateEncodingStrategy = .formatted(formatter)
        return encoder
    }
    
    // MARK: - Given
    private func givenMovie(id: Int) -> Movie {
        let releaseDate = Date(dateString: "2020-02-20", format: "yyyy-MM-dd")
        return Movie(adult: false, backdropPath: "/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                     genreIds: [1, 2, 3], id: id,
                     originalLanguage: nil, originalTitle: nil,
                     overview: nil, popularity: nil,
                     posterPath: nil, releaseDate: releaseDate,
                     title: nil, video: true,
                     voteAverage: 1.1, voteCount: 9)
    }
    
    private func givenErrorData() -> Data {
        let error = ResponseError(statusMessage: "This is error", statusCode: 987)
        let data = try? JSONEncoder().encode(error)
        return data ?? Data()
    }
    
    private func givenDummyData() -> Data {
        let dummy = """
            {"abc": "xyz"}
            """
        let data = try? JSONEncoder().encode(dummy)
        return data ?? Data()
    }
    
    // MARK: - getPosters
    func testNetworkManager_getPosters_callsExpectedURL() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        // when
        sut.getPosters {_ in 
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        let expectedValue = "\(Constants.baseURL)/movie/now_playing"
        XCTAssertEqual(mockSession.cachedURL?.absoluteString, expectedValue)
    }
    
    func testNetworkManager_getPosters_callsExpectedParameters() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        // when
        sut.getPosters {_ in
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(mockSession.cachedParameters?.count, 3)
        XCTAssertEqual(mockSession.cachedParameters?["language"] as? String, "en-US")
        XCTAssertEqual(mockSession.cachedParameters?["page"] as? String, "undefined")
        XCTAssertEqual(mockSession.cachedParameters?["api_key"] as? String, Constants.apiKey)
    }
    
    func testNetworkManager_getPosters_success() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        let posterResponse = MovieResponse(date: nil, page: 1,
                                            results: [givenMovie(id: 100),
                                                      givenMovie(id: 101),
                                                      givenMovie(id: 102)],
                                            totalPages: 10, totalResults: 9)
        let mockedData = try? getEncoder().encode(posterResponse)
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/now_playing?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=undefined")!,
                        dataType: .json, statusCode: 200,
                        data: [.get: mockedData ?? Data()])
        mock.register()
        // when
        var result: MovieResponse?
        sut.getPosters { response in
            result = try? response.get()
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(result, posterResponse)
    }
    
    func testNetworkManager_getPosters_wrongJSONFormatReturnError() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/now_playing?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=undefined")!,
                        dataType: .json, statusCode: 200,
                        data: [.get: givenDummyData()])
        mock.register()
        // when
        var result: APIError?
        sut.getPosters { response in
            switch response {
            case .success(_):
                break
            case .failure(let error):
                result = error
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(result, .serialization)
    }
    
    func testNetworkManager_getPosters_responseErrorReturnError() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/now_playing?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=undefined")!,
                        dataType: .json, statusCode: 401,
                        data: [.get: givenErrorData()])
        mock.register()
        // when
        var result: APIError?
        sut.getPosters { response in
            switch response {
            case .success(_):
                break
            case .failure(let error):
                result = error
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(result, .knownError(code: 987))
    }
    
    // MARK: - getMovies
    func testNetworkManager_getMovies_callsExpectedURL() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        // when
        sut.getMovies(page: 1) {_ in
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        let expectedValue = "\(Constants.baseURL)/movie/popular"
        XCTAssertEqual(mockSession.cachedURL?.absoluteString, expectedValue)
    }
    
    func testNetworkManager_getMovies_callsExpectedParameters() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        // when
        sut.getMovies(page: 1) {_ in
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(mockSession.cachedParameters?.count, 3)
        XCTAssertEqual(mockSession.cachedParameters?["language"] as? String, "en-US")
        XCTAssertEqual(mockSession.cachedParameters?["page"] as? Int, 1)
        XCTAssertEqual(mockSession.cachedParameters?["api_key"] as? String, Constants.apiKey)
    }
    
    func testNetworkManager_getMovies_success() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        let movieResponse = MovieResponse(date: nil, page: 1,
                                            results: [givenMovie(id: 100),
                                                      givenMovie(id: 101),
                                                      givenMovie(id: 102)],
                                            totalPages: 10, totalResults: 9)
        let mockedData = try? getEncoder().encode(movieResponse)
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/popular?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=1")!,
                        dataType: .json, statusCode: 200,
                        data: [.get: mockedData ?? Data()])
        mock.register()
        // when
        var result: MovieResponse?
        sut.getMovies(page: 1) { response in
            result = try? response.get()
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(result, movieResponse)
    }
    
    func testNetworkManager_getMovies_wrongJSONFormatReturnError() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/popular?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=1")!,
                        dataType: .json, statusCode: 200,
                        data: [.get: givenDummyData()])
        mock.register()
        // when
        var result: APIError?
        sut.getMovies(page: 1) { response in
            switch response {
            case .success(_):
                break
            case .failure(let error):
                result = error
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(result, .serialization)
    }
    
    func testNetworkManager_getMovies_responseErrorReturnError() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/popular?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=1")!,
                        dataType: .json, statusCode: 401,
                        data: [.get: givenErrorData()])
        mock.register()
        // when
        var result: APIError?
        sut.getMovies(page: 1) { response in
            switch response {
            case .success(_):
                break
            case .failure(let error):
                result = error
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(result, .knownError(code: 987))
    }
    
    // MARK: - getMovieDetail
    func testNetworkManager_getMovieDetail_callsExpectedURL() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        // when
        sut.getMovieDetail(id: 111) {_ in
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        let expectedValue = "\(Constants.baseURL)/movie/111"
        XCTAssertEqual(mockSession.cachedURL?.absoluteString, expectedValue)
    }
    
    func testNetworkManager_getMovieDetail_callsExpectedParameters() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        // when
        sut.getMovieDetail(id: 1) {_ in
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(mockSession.cachedParameters?.count, 2)
        XCTAssertEqual(mockSession.cachedParameters?["language"] as? String, "en-US")
        XCTAssertEqual(mockSession.cachedParameters?["api_key"] as? String, Constants.apiKey)
    }
    
    func testNetworkManager_getMovieDetail_success() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        let movie = MovieDetail(adult: nil, backdropPath: nil, budget: nil,
                                genres: nil, homepage: nil, id: 10,
                                imdbID: nil, originalLanguage: nil, originalTitle: nil,
                                overview: nil, popularity: nil, posterPath: nil,
                                releaseDate: Date(dateString: "2020-02-20",
                                                  format: "yyyy-MM-dd"),
                                revenue: nil, runtime: 123,
                                status: nil, tagline: nil, title: "abc",
                                video: nil, voteAverage: nil, voteCount: nil)
        let mockedData = try? getEncoder().encode(movie)
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/\(movie.id)?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US")!,
                        dataType: .json, statusCode: 200,
                        data: [.get: mockedData ?? Data()])
        mock.register()
        // when
        var result: MovieDetail?
        sut.getMovieDetail(id: movie.id) { response in
            result = try? response.get()
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(result, movie)
    }
    
    func testNetworkManager_getMovieDetail_wrongJSONFormatReturnError() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/1?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US")!,
                        dataType: .json, statusCode: 200,
                        data: [.get: givenDummyData()])
        mock.register()
        // when
        var result: APIError?
        sut.getMovieDetail(id: 1) { response in
            switch response {
            case .success(_):
                break
            case .failure(let error):
                result = error
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(result, .serialization)
    }
    
    func testNetworkManager_getMovieDetail_responseErrorReturnError() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        let mock = Mock(url: URL(string: "\(Constants.baseURL)/movie/1?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US")!,
                        dataType: .json, statusCode: 401,
                        data: [.get: givenErrorData()])
        mock.register()
        // when
        var result: APIError?
        sut.getMovieDetail(id: 1) { response in
            switch response {
            case .success(_):
                break
            case .failure(let error):
                result = error
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        // then
        XCTAssertEqual(result, .knownError(code: 987))
    }
}
