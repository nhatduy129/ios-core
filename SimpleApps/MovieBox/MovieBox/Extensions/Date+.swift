//
//  Date+.swift
//  MovieBox
//
//  Created by Duy Nguyen on 29/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import Foundation

extension Date {
    init?(dateString: String, format: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = format
        guard let date = dateStringFormatter.date(from: dateString)
        else { return nil }
        self.init(timeInterval: 0, since: date)
    }
    
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
