//
//  SplashScreenViewModel.swift
//  MovieBox
//
//  Created by Duy Nguyen on 1/8/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import Foundation

protocol SplashScreenViewModelType {
    func fetchMoviesAndPosters(completion: @escaping ((Swift.Result<(movies: [Movie], posters: [Movie]),
                                                                    APIError>) -> Void))
}

final class SplashScreenViewModel: SplashScreenViewModelType {
    private let networkManager: NetworkManagerType
    
    init(networkManager: NetworkManagerType = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func fetchMoviesAndPosters(completion: @escaping ((Swift.Result<(movies: [Movie], posters: [Movie]),
                                                                    APIError>) -> Void)) {
        var movies = [Movie]()
        var posters = [Movie]()
        var error: APIError?
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        dispatchGroup.enter()
        networkManager.getMovies(page: 1) { result in
            switch result {
            case .success(let data):
                movies = data.results
            case .failure(let err):
                error = err
            }
            dispatchGroup.leave()
        }
        networkManager.getPosters { result in
            switch result {
            case .success(let data):
                posters = data.results
            case .failure(let err):
                error = err
            }
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success((movies, posters)))
            }
        }
    }
}
