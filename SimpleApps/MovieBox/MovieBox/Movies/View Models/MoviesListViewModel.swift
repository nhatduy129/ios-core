//
//  MoviesListViewModel.swift
//  MovieBox
//
//  Created by Duy Nguyen on 30/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import Foundation
import Alamofire

protocol MoviesListViewModelType {
    func getNumberOfMovies() -> Int
    func getMovie(byIndex index: Int) -> Movie
    func getNumberOfPoster() -> Int
    func getPoster(byIndex index: Int) -> Movie
    func loadMoreMovies(completion: @escaping (Swift.Result<Void, APIError>) -> Void)
    func getMovieDetail(movieId id: Int, completion: @escaping (Swift.Result<MovieDetail, APIError>) -> Void)
}

final class MoviesListViewModel: MoviesListViewModelType {
    private var movies: [Movie]
    private let poster: [Movie]
    private let networkManager: NetworkManagerType
    private var currentPage = 1
    
    init(movies: [Movie], poster: [Movie],
         networkManager: NetworkManagerType = NetworkManager.shared) {
        self.movies = movies
        self.poster = poster
        self.networkManager = networkManager
    }
    
    func getNumberOfMovies() -> Int {
        return movies.count
    }
    
    func getMovie(byIndex index: Int) -> Movie {
        return movies[index]
    }
    
    func getNumberOfPoster() -> Int {
        return poster.count
    }
    
    func getPoster(byIndex index: Int) -> Movie {
        return poster[index]
    }
    
    func loadMoreMovies(completion: @escaping (Swift.Result<Void, APIError>) -> Void) {
        currentPage += 1
        networkManager.getMovies(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.movies.append(contentsOf: data.results)
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getMovieDetail(movieId id: Int, completion: @escaping (Swift.Result<MovieDetail, APIError>) -> Void) {
        networkManager.getMovieDetail(id: id, completion: completion)
    }
}
