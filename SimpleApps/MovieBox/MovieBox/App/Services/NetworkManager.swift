//
//  NetworkManager.swift
//  MovieBox
//
//  Created by Duy Nguyen on 28/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import Alamofire

final class NetworkManager {
    static let shared = NetworkManager(sessionManager: AF)
    private let sessionManager: Session
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }()
    
    init(sessionManager: Session) {
        self.sessionManager = sessionManager
    }
    
    /// https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=undefined&api_key=55957fcf3ba81b137f8fc01ac5a31fb5
    func getPosters(completion: @escaping (Swift.Result<MovieResponse, AFError>) -> Void) {
        let params: Parameters = [
            "language": "en-US",
            "page": "undefined",
            "api_key": Constants.apiKey
        ]
        sessionManager.request("\(Constants.baseURL)/movie/now_playing", method: .get,
                               parameters: params, encoding: URLEncoding.default)
            .validate()
            .responseDecodable(of: MovieResponse.self, decoder: decoder) { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    /// https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=55957fcf3ba81b137f8fc01ac5a31fb5
    func getMovies(page: Int, completion: @escaping (Swift.Result<MovieResponse, AFError>) -> Void) {
        let params: Parameters = [
            "language": "en-US",
            "page": page,
            "api_key": Constants.apiKey
        ]
        sessionManager.request("\(Constants.baseURL)/movie/popular", method: .get,
                               parameters: params, encoding: URLEncoding.default)
            .validate()
            .responseDecodable(of: MovieResponse.self, decoder: decoder) { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    /// https://api.themoviedb.org/3/genre/movie/list?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US
    func getMovieDetail(id: Int, completion: @escaping (Swift.Result<MovieDetail, AFError>) -> Void) {
        let params: Parameters = [
            "language": "en-US",
            "api_key": Constants.apiKey
        ]
        sessionManager.request("\(Constants.baseURL)/movie/\(id)", method: .get,
                               parameters: params, encoding: URLEncoding.default)
            .validate()
            .responseDecodable(of: MovieDetail.self, decoder: decoder) { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
