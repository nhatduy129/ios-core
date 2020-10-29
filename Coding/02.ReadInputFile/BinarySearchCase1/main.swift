//
//  main.swift
//  BinarySearchCase1
//
//  Created by Duy Nguyen on 29/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//
// https://www.spoj.com/problems/HACKRNDM/

import Foundation

/// Find a value in an array. Return index if value exist, otherwise return nil
func binarySearch(value: Int, array: [Int]) -> Int? {
    return array.firstIndex(of: value)
}

func main() {
#if DEBUG
    freopen("/Users/duynguyen/input.txt", "r", stdin)
#endif
    let firstLine = readLine()!.split(separator: " ").map{Int(String($0))!}
    let k = firstLine[1]
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.sort()
    var count: Int64 = 0
    for item in arr {
        if binarySearch(value: item + k, array: arr) != nil {
            count += 1
        }
        if binarySearch(value: item - k, array: arr) != nil {
            count += 1
        }
    }
    print(count/2)
}

main()

