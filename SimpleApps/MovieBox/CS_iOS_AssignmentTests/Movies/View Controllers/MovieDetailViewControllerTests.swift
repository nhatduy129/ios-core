//
//  MovieDetailViewControllerTests.swift
//  CS_iOS_AssignmentTests
//
//  Created by Duy Nguyen on 31/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import XCTest
@testable import CS_iOS_Assignment

final class MovieDetailViewControllerTests: XCTestCase {
    var sut: MovieDetailViewController!
    var viewModel: MovieDetailViewModel!
    
    override func setUp() {
        super.setUp()
        let movieDetail = MovieDetail(adult: nil, backdropPath: nil, budget: nil,
                                      genres: [Genre(id: 2, name: "a"),
                                               Genre(id: 3, name: "b")],
                                      homepage: nil, id: 1,
                                      imdbID: nil, originalLanguage: nil, originalTitle: nil,
                                      overview: "It is movie", popularity: nil, posterPath: nil,
                                      releaseDate: Date(dateString: "2021-02-20", format: "yyyy-MM-dd"),
                                      revenue: nil, runtime: 123,
                                      status: nil, tagline: nil, title: "abc",
                                      video: nil, voteAverage: nil, voteCount: nil)
        viewModel = MovieDetailViewModel(movieDetail: movieDetail)
        sut = MovieDetailViewController(viewModel: viewModel)
        sut?.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_titleLabel_text() {
        XCTAssertEqual(sut.titleLabel.text, viewModel.getTitle())
    }
    
    func test_releaseDateAndRuntimeLabel_text() {
        XCTAssertEqual(sut.releaseDateAndRuntimeLabel.text, viewModel.getReleaseDateAndRuntime())
    }
    
    func test_overviewLabel_text() {
        XCTAssertEqual(sut.overviewLabel.text, viewModel.getOverview())
    }
    
    // MARK: - UICollectionView
    func test_collectionView_numberOfCells() {
        // when
        let actual = sut.collectionView(sut.collectionView, numberOfItemsInSection: 0)
        // then
        XCTAssertEqual(actual, viewModel.getNumberOfGenres())
    }
    
    func test_collectionView_cellForRowAt_isGenreCell() {
        // when
        let cell = sut.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        // then
        XCTAssertTrue(cell is GenreCell)
    }
    
    func test_collectionView_cellForRowAt_cellGenre() {
        // given
        let index = 1
        // when
        let cell = sut.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: index, section: 0)) as? GenreCell
        // then
        XCTAssertEqual(cell?.genre, viewModel.getGenre(byIndex: index))
    }
}
