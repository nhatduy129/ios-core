//
//  NetworkManager.swift
//  60.AlamofireUnitTests
//
//  Created by Duy Nguyen on 27/7/21.
//

import Alamofire

class NetworkManager {
    private let baseURL = "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=undefined&api_key=55957fcf3ba81b137f8fc01ac5a31fb5"
    static let shared = NetworkManager(sessionManager: AF)
    private let sessionManager: Session
    
    init(sessionManager: Session) {
        self.sessionManager = sessionManager
    }
    
    func getPosters(completion: @escaping (Swift.Result<PosterResponse?, AFError>) -> Void) {
        sessionManager.request(baseURL, method: .get)
            .validate()
            .responseDecodable(of: PosterResponse.self) { response in
                completion(.success(nil))
        }
    }
}
