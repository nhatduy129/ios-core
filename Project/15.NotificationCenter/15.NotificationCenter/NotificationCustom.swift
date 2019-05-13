//
//  NotificationCustom.swift
//  15.NotificationCenter
//
//  Created by Duy Nguyen on 13/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

class NotificationCustom: NSObject {
    
    var handlers = [String: Array<Selector>]()
    
    func addObserver(_ observer: Any, selector aSelector: Selector, name: String) {
        
    }
}
