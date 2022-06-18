//
//  NetworkManagerTests.swift
//  60.AlamofireUnitTestsTests
//
//  Created by Duy Nguyen on 28/7/21.
//

import XCTest
import Alamofire
import Mocker
@testable import _0_AlamofireUnitTests

class NetworkManagerTests: XCTestCase {
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
    
    func testNetworkManager_getPosters_callsExpectedURL() {
        // given
        let promise = expectation(description: "Completion handler invoked")
        // when
        sut.getPosters {res in
            switch res {
            case .success(let data):
                print(data)
                promise.fulfill()
            case .failure(_):
                break
            }
        }
        wait(for: [promise], timeout: 1)
        // then
        let expectedValue = "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=undefined&api_key=55957fcf3ba81b137f8fc01ac5a31fb5"
        XCTAssertEqual(mockSession.cachedURL?.absoluteString, expectedValue)
    }
}
