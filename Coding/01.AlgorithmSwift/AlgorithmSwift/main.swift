//
//  main.swift
//  AlgorithmSwift
//
//  Created by Duy Nguyen on 28/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Foundation

enum Action: String {
    case insert
    case addToValue
    case addToKey
    case get
}

func hashMap(queryType: [String], query: [[Int]]) -> Int64 {
    var bufferKey = 0
    var sum: Int64 = 0, bufferValue: Int64 = 0
    var dict: [Int: Int64] = [:]
    for i in (0..<queryType.count) {
        switch queryType[i] {
        case Action.insert.rawValue:
            dict[query[i][0] - bufferKey] = Int64(query[i][1]) - bufferValue
        case Action.addToValue.rawValue:
            bufferValue += Int64(query[i][0])
        case Action.addToKey.rawValue:
            bufferKey += query[i][0]
        case Action.get.rawValue:
            if let value = dict[query[i][0] - bufferKey] {
                sum += value + bufferValue
            }
        default:
            break
        }
    }
    return sum
}

let output = hashMap(queryType:
    ["insert",
    "addToValue",
    "get",
    "insert",
    "addToKey",
    "addToValue",
    "get"], query:
    [[1,2],
    [2],
    [1],
    [2,3],
    [1],
    [-1],
    [3]])
print(output)
