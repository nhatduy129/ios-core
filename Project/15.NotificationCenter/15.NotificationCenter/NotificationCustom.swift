//
//  NotificationCustom.swift
//  15.NotificationCenter
//
//  Created by Duy Nguyen on 13/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

class NotificationCustom: NSObject {
    
    class Notify {
        weak var observer: NSObject?
        var selector: Selector
        
        init(observer: Any, selector: Selector) {
            self.observer = observer as? NSObject
            self.selector = selector
        }
    }
    
    static var shared = NotificationCustom()
    var handlers = [String: Array<Notify>]()
    
    private override init() {
        super.init()
    }
    
    func addObserver(_ observer: Any, selector aSelector: Selector, name: String) {
        if handlers[name] == nil {
            handlers[name] = Array<Notify>()
        }
        let notify = Notify(observer: observer, selector: aSelector)
        handlers[name]?.append(notify)
    }
    
    func post(name: String, object: Any? = nil) {
        for notify in handlers[name]! {
            notify.observer?.perform(notify.selector, with: object)
        }
    }
}
