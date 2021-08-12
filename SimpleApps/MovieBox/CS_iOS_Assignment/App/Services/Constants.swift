//
//  Constants.swift
//  CS_iOS_Assignment
//
//  Created by Duy Nguyen on 28/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import Foundation

final class Constants {
    private static let constantKey = "Constants"
    
    private static func getValue(byKey key: String) -> String {
        let dict = Bundle.main.object(forInfoDictionaryKey: constantKey) as? [String: String]
        return dict?[key] ?? ""
    }
    
    static let baseURL = getValue(byKey: "BaseURL")
    static let apiKey = getValue(byKey: "APIKey")
    static let baseImageURL = getValue(byKey: "BaseImageURL")
}
