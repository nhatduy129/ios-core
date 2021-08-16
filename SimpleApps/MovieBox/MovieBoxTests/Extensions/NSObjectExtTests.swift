//
//  NSObjectExtTests.swift
//  MovieBoxTests
//
//  Created by Duy Nguyen on 29/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import XCTest
@testable import MovieBox

final class NSObjectExtTests: XCTestCase {
    func testNSObjectExt_classNameStatic() {
        XCTAssertEqual(NSObjectExtTests.className, "NSObjectExtTests")
    }
    
    func testNSObjectExt_className() {
        let obj = NSObjectExtTests()
        XCTAssertEqual(obj.className, "NSObjectExtTests")
    }
}
