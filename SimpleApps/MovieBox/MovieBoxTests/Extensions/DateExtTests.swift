//
//  DateExtTests.swift
//  MovieBoxTests
//
//  Created by Duy Nguyen on 29/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import XCTest
@testable import MovieBox

final class DateExtTests: XCTestCase {
    func testDateExt_initDateString_success() {
        // given
        let dateString = "2020-02-20"
        let format = "yyyy-MM-dd"
        // when
        let result = Date(dateString: dateString, format: format)
        // then
        XCTAssertNotNil(result)
        let calendar = Calendar.current.dateComponents([.day, .year, .month], from: result!)
        XCTAssertEqual(calendar.day, 20)
        XCTAssertEqual(calendar.month, 2)
        XCTAssertEqual(calendar.year, 2020)
    }
    
    func testDateExt_initDateString_wrongFormatReturnNil() {
        // given
        let dateString = "2020-02-20"
        let format = "dd-MM-yyyy"
        // when
        let result = Date(dateString: dateString, format: format)
        // then
        XCTAssertNil(result)
    }
    
    func testDateExt_initDateString_wrongDateStringReturnNil() {
        // given
        let dateString = "Unittest"
        let format = "yyyy-MM-dd"
        // when
        let result = Date(dateString: dateString, format: format)
        // then
        XCTAssertNil(result)
    }
    
    func testDateExt_toString_success() {
        // given
        let date = Date(timeIntervalSince1970: 86400)
        // when
        let result = date.toString(format: "d MMM yyyy")
        // then
        XCTAssertEqual(result, "2 Jan 1970")
    }
}
