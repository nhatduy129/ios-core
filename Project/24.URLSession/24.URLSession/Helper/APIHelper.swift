//
//  APIHelper.swift
//  24.URLSession
//
//  Created by Duy Nguyen on 9/7/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

class APIHelper {
    
    private static let defaultSession = URLSession.shared
    private static let decoder = JSONDecoder()
    
    static func getListBooks(completed: @escaping (([Book]) -> Void), error: ((String) -> Void)?) {
        var request = URLRequest(url: URL(string: "https://storage.googleapis.com/carousell-interview-assets/ios/ios-sse-1a.json")!)
        request.httpMethod = "GET"
        let task = defaultSession.dataTask(with: request) { data, urlResponse, err in
            if let err = err {
                error?(err.localizedDescription)
            } else if let data = data,
                let urlResponse = urlResponse as? HTTPURLResponse,
                urlResponse.statusCode == 200 {
                do {
                    let dataParsed = try decoder.decode([Book].self, from: data)
                    completed(dataParsed)
                } catch (let err) {
                    error?(err.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    static func searchMovie(keyword: String, completed: @escaping (([Movie]) -> Void), error: ((String) -> Void)?) {
        var components = URLComponents(string: "https://api.themoviedb.org/3/search/movie")!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: "008bd3a6c99b393aaa2a290d16f21937"),
            URLQueryItem(name: "query", value: keyword),
            URLQueryItem(name: "page", value: "1"),
        ]
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        let request = URLRequest(url: components.url!)
        
        let task = defaultSession.dataTask(with: request) { data, urlResponse, err in
            if let err = err {
                error?(err.localizedDescription)
            } else if let data = data,
                let urlResponse = urlResponse as? HTTPURLResponse,
                urlResponse.statusCode == 200 {
                do {
                    let dataParsed = try decoder.decode(PagingResponse<Movie>.self, from: data)
                    completed(dataParsed.results ?? [])
                } catch (let err) {
                    error?(err.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
