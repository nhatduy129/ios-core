//
//  TrackingManager.swift
//  54.TrackingManager
//
//  Created by Duy Nguyen on 5/12/20.
//

import Foundation

enum EventType {
    case action, browse
}

struct Event {
    let name: String
    let type: EventType
    let properties: [String: Any]?
}

class TrackingManager {
    static let shared = TrackingManager()
    private var data: [Event]
    private let queue: DispatchQueue
    private let maximumNumber = 10
    
    private init() {
        data = []
        queue = DispatchQueue.init(label: "TrackingManager")
    }
    
    func add(event: Event) {
        queue.async {[weak self] in
            guard let self = self else { return }
            self.data.append(event)
            if self.data.count == self.maximumNumber {
                self.pushData()
            }
        }
    }
    
    func removeAllEvent() {
        queue.async {[weak self] in
            self?.data.removeAll()
        }
    }
    
    func pushData() {
        let data = self.data
        removeAllEvent()
        NetworkManager.sendEvent(data: data) {
            switch {
            case .success:
                break
            case failture:
                self.data.append(contentsOf: data)
            }
        }
    }
}

class NetworkManager {
    static func sendEvent(data: [Event], completion: () -> Void) {
        
    }
}
