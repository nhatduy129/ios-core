import Foundation
import UIKit

extension String {
    
    func toDate(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone.current
        return formatter.date(from: self)
    }
}

extension Date {
    
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
}

extension Date {
    
    var timeAgoSinceNow: String {
        return getTimeAgoSinceNow() + " ago"
    }
    
    private func getTimeAgoSinceNow() -> String {
        
        var interval = Calendar.current.dateComponents([.year], from: self, to: Date()).year!
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " year" : "\(interval)" + " years"
        }
        
        interval = Calendar.current.dateComponents([.month], from: self, to: Date()).month!
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " month" : "\(interval)" + " months"
        }
        
        interval = Calendar.current.dateComponents([.day], from: self, to: Date()).day!
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " day" : "\(interval)" + " days"
        }
        
        interval = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour!
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " hour" : "\(interval)" + " hours"
        }
        
        interval = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute!
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " minute" : "\(interval)" + " minutes"
        }
        
        return "a moment"
    }
}

var str1 = "2019-06-20@15:14:20"
var str2 = "2019-09-21"

var date1: Date = str1.toDate(format: "yyyy-MM-dd@HH:mm:ss")!
var date2: Date = str2.toDate(format: "yyyy-MM-dd")!

print(date1.toString(format: "yyyy MMM dd HH:mm:ss"))
print(date2.timeIntervalSince1970)

if date1 > date2 {
    print("date1 is greater than date2")
} else if date2 > date1 {
    print("date2 is greater than date1")
} else {
    print("They are equal")
}

var diff: TimeInterval = date2.timeIntervalSince(date1)
print(diff / 3600)

print(date1.timeAgoSinceNow)
date1.timeIntervalSince1970
