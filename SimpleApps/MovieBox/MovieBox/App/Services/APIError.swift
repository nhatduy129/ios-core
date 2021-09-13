//
//  APIError.swift
//  MovieBox
//
//  Created by Duy Nguyen on 27/8/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import Foundation
import Alamofire

struct ResponseError: Codable {
    let statusMessage: String?
    let statusCode: Int?
    
    private enum CodingKeys: String, CodingKey {
        case statusMessage = "status_message"
        case statusCode = "status_code"
    }
}

enum APIError: Error, Equatable {
    case noInternet
    case knownError(code: Int)
    case serialization
    case unknownError
    
    var description: String {
        switch self {
        case .noInternet:
            return "There is no internet connection."
        case .knownError(let code):
            return "Error code \(code)"  // In real project, we will determine error message base on the code.
        case .serialization:
            return "Please try again later."
        case .unknownError:
            return "We are facing difficulty, please try again later."
        }
    }
}

extension AFError {
    func mapToAPIError(responseData data: Data?) -> APIError {
        switch self {
        case .sessionTaskFailed(let error):
            if let error = error as? URLError, error.code == URLError.notConnectedToInternet {
                return .noInternet
            }
            return .unknownError
        case .responseValidationFailed:
            guard let data = data,
                  let error = try? JSONDecoder().decode(ResponseError.self, from: data),
                  let code = error.statusCode
            else { return .unknownError }
            return .knownError(code: code)
        case .responseSerializationFailed:
            return .serialization
        default:
            return .unknownError
        }
    }
}
