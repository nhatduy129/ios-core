//
//  RatingViewTests.swift
//  MovieBoxTests
//
//  Created by Duy Nguyen on 31/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import XCTest
import UIKit
@testable import MovieBox

final class RatingViewTests: XCTestCase {
    var sut: RatingView!
    
    override func setUp() {
        super.setUp()
        sut = RatingView()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_assignRating() {
        // given
        let rating = 5.5
        // when
        sut.rating = rating
        // then
        XCTAssertEqual(sut.ratingLabel.text, String(Int(rating * 10)))
    }
    
    func test_getCircleColor() {
        // given
        let rating: Double = 2
        let alpha: CGFloat = 1
        let expected = UIColor(red: 1 - CGFloat(rating) * 0.1,
                               green: 1, blue: 26/255,
                               alpha: alpha)
        // when
        sut.rating = rating
        let actual = sut.getCircleColor(alpha: alpha)
        // then
        XCTAssertEqual(actual, expected)
    }
    
    func test_drawTwoCircle() {
        // given
        let rating = 2.5
        let expected = 2
        // when
        sut.rating = rating
        let allCircle = sut.layer.sublayers?.filter { $0 is CAShapeLayer }
        // then
        XCTAssertEqual(allCircle?.count, expected)
    }
}
