//
//  MovieDetailViewModel.swift
//  MovieBox
//
//  Created by Duy Nguyen on 31/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import Foundation

protocol MovieDetailViewModelType {
    func getTitle() -> String?
    func getReleaseDateAndRuntime() -> String?
    func getOverview() -> String?
    func getPosterURL() -> URL?
    func getNumberOfGenres() -> Int
    func getGenre(byIndex index: Int) -> Genre?
    func getMovieDetail(completion: @escaping (Swift.Result<MovieDetail, APIError>) -> Void)
}

final class MovieDetailViewModel: MovieDetailViewModelType {
    private let movieId: Int
    private var movieDetail: MovieDetail?
    private let networkManager: NetworkManagerType

    init(movieId: Int,
         networkManager: NetworkManagerType = NetworkManager.shared) {
        self.movieId = movieId
        self.networkManager = networkManager
    }
    
    func getTitle() -> String? {
        return movieDetail?.title
    }
    
    func getReleaseDateAndRuntime() -> String? {
        guard let movieDetail = movieDetail else {
            return nil
        }
        let releaseDate = movieDetail.releaseDate?.toString(format: "MMMM d, yyyy") ?? "Unknown"
        var runtimeString = "Unknown"
        if let runtime = movieDetail.runtime {
            if runtime > 60 {
                runtimeString = "\(runtime / 60)h \(runtime % 60)m"
            } else {
                runtimeString = "\(runtime)m"
            }
        }
        return "\(releaseDate)  -  \(runtimeString)"
    }
    
    func getOverview() -> String? {
        return movieDetail?.overview
    }
    
    func getPosterURL() -> URL? {
        return movieDetail?.getPosterURL()
    }
    
    func getNumberOfGenres() -> Int {
        return movieDetail?.genres?.count ?? 0
    }
    
    func getGenre(byIndex index: Int) -> Genre? {
        return movieDetail?.genres?[index]
    }

    func getMovieDetail(completion: @escaping (Swift.Result<MovieDetail, APIError>) -> Void) {
        networkManager.getMovieDetail(id: movieId) { [weak self] result in
            switch result {
            case .success(let movieDetail):
                self?.movieDetail = movieDetail
                completion(.success(movieDetail))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
