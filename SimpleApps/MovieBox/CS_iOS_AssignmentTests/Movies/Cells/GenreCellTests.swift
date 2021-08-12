//
//  GenreCellTests.swift
//  CS_iOS_AssignmentTests
//
//  Created by Duy Nguyen on 31/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import XCTest
@testable import CS_iOS_Assignment

final class GenreCellTests: XCTestCase {
    var sut: GenreCell!
    
    override func setUp() {
        super.setUp()
        sut = GenreCell()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_assignGenre() {
        // given
        let genre = Genre(id: 1, name: "Cartoon")
        // when
        sut.genre = genre
        // then
        XCTAssertEqual(sut.nameLabel.text, genre.name?.uppercased())
    }
}
