//
//  Date+.swift
//  JohnWeatherApp
//
//  Created by Macbook on 11/03/2023.
//

import Foundation

extension Date {
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }


}
