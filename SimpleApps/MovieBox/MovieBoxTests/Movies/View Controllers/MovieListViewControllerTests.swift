//
//  MovieListViewControllerTests.swift
//  MovieBoxTests
//
//  Created by Duy Nguyen on 31/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import XCTest
@testable import MovieBox

final class MovieListViewControllerTests: XCTestCase {
    var sut: MoviesListViewController!
    var viewModel: MoviesListViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = MoviesListViewModel(movies: [getMovie(id: 100),
                                                 getMovie(id: 101)],
                                        poster: [getMovie(id: 1000),
                                                 getMovie(id: 1001),
                                                 getMovie(id: 1002)])
        sut = MoviesListViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        viewModel = nil
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

    // MARK: - UITableView
    func test_numberOfSection_inTableView() {
        // when
        let actual = sut.numberOfSections(in: sut.tableView)
        // then
        XCTAssertEqual(actual, 2)
    }
    
    func test_tableView_cellForRowAt_isPosterCollectionCell() {
        // when
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        // then
        XCTAssertTrue(cell is PosterCollectionCell)
    }
    
    func test_tableView_cellForRowAt_isMovieCell() {
        // when
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 1))
        // then
        XCTAssertTrue(cell is MovieCell)
    }
    
    func test_tableView_numberOfRowsInSection_playingNowSection() {
        // when
        let actual = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        // then
        XCTAssertEqual(actual, 1)
    }
    
    func test_tableView_numberOfRowsInSection_mostPopularSection() {
        // when
        let actual = sut.tableView(sut.tableView, numberOfRowsInSection: 1)
        // then
        XCTAssertEqual(actual, 2)
    }
    
    func test_tableView_titleForHeaderInSection_playingNowSection() {
        // when
        let actual = sut.tableView(sut.tableView, titleForHeaderInSection: 0)
        // then
        XCTAssertEqual(actual, "Playing now")
    }
    
    func test_tableView_titleForHeaderInSection_mostPopularSection() {
        // when
        let actual = sut.tableView(sut.tableView, titleForHeaderInSection: 1)
        // then
        XCTAssertEqual(actual, "Most popular")
    }
    
    // MARK: - UICollectionView
    func test_collectionView_cellForRowAt_isPostCell() throws {
        // when
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        let posterCollectionCell = try XCTUnwrap(cell as? PosterCollectionCell)
        let actual = sut.collectionView(posterCollectionCell.collectionView, cellForItemAt: IndexPath(row: 2, section: 0))
        // then
        XCTAssertTrue(actual is PosterCell)
    }
    
    func test_collectionView_numberOfItemsInSection() throws {
        // when
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        let posterCollectionCell = try XCTUnwrap(cell as? PosterCollectionCell)
        let actual = sut.collectionView(posterCollectionCell.collectionView, numberOfItemsInSection: 0)
        // then
        XCTAssertEqual(actual, 3)
    }
}
