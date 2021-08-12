//
//  NSObjectExtTests.swift
//  CS_iOS_AssignmentTests
//
//  Created by Duy Nguyen on 29/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import XCTest
@testable import CS_iOS_Assignment

final class NSObjectExtTests: XCTestCase {
    func testNSObjectExt_classNameStatic() {
        XCTAssertEqual(NSObjectExtTests.className, "NSObjectExtTests")
    }
    
    func testNSObjectExt_className() {
        let obj = NSObjectExtTests()
        XCTAssertEqual(obj.className, "NSObjectExtTests")
    }
}
