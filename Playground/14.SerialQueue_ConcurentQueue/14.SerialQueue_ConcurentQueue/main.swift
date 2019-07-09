//
//  main.swift
//  14.SerialQueue_ConcurentQueue
//
//  Created by Duy Nguyen on 28/6/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

let serialQueue = DispatchQueue(label: "a")
let concurrentQueue = DispatchQueue(label: "b", attributes: .concurrent)

serialQueue.async {
    for i in 0...100 {
        print("serialQueue 1: \(i)")
    }
}

serialQueue.async {
    for i in 0...100 {
        print("serialQueue 2: \(i)")
    }
}

DispatchQueue.main.asyncAfter(deadline: .now() + 100000) {
    print("con cac")
}
