//
//  main.swift
//  AlgorithmSwift
//
//  Created by Duy Nguyen on 28/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Foundation

func countDigits(n: Int64) -> Int {
    return String(n).count
}

func concatenationsSum(a: [Int]) -> Int64 {
    let a = a.map { Int64($0) }
    let sum: Int64 = a.reduce(0, +)
    var res: Int64 = 0
    for i in 0..<a.count {
        res += sum * Int64(pow(10, Double(countDigits(n: a[i]))))
        res += a[i] * Int64(a.count)
    }
    return res
}

func main() {
    let res = concatenationsSum(a: [10])
    print(res)
}

main()
