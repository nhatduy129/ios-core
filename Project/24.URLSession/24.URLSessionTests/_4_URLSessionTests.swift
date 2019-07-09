//
//  _4_URLSessionTests.swift
//  24.URLSessionTests
//
//  Created by Duy Nguyen on 9/7/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import XCTest
@testable import _4_URLSession

class _4_URLSessionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let expectation = self.expectation(description: "expect 1")
        expectation.expectedFulfillmentCount = 1
        APIHelper.getListBooks(completed: { data in
            print(data)
            XCTAssert(data.count > 0)
            expectation.fulfill()
        }, error: nil)
        wait(for: [expectation], timeout: 5)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
