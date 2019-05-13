//
//  NotificationCustom.swift
//  15.NotificationCenter
//
//  Created by Duy Nguyen on 13/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

class NotificationCustom: NSObject {
    
    class Observer {
        weak var observer: NSObject?
        var selector: Selector
        
        init(observer: Any, selector: Selector) {
            self.observer = observer as? NSObject
            self.selector = selector
        }
    }
    
    static var shared = NotificationCustom()
    var handlers = [String: Array<Observer>]()
    
    private override init() {
        super.init()
    }
    
    func addObserver(_ observer: Any, selector aSelector: Selector, name: String) {
        if handlers[name] == nil {
            handlers[name] = Array<Observer>()
        }
        handlers[name]?.append(Observer(observer: observer, selector: aSelector))
    }
    
    func post(name: String) {
        for observer in handlers[name]! {
            observer.observer?.perform(observer.selector)
        }
    }
}
