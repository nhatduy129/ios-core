//
//  main.swift
//  04.BinarySearchCase2
//
//  Created by Duy Nguyen on 29/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Foundation

func guess(_ k: Int) -> Int {
    let picked = 6
    if picked > k { return 1}
    else if picked < k { return -1 }
    else { return 0 }
}

/*
 Binary search case 2: Given a serial numbers from 1 to n
 We need to find K satisfy 1 -> K - 1 = FALSE, K -> n == TRUE
 Ex: https://leetcode.com/problems/guess-number-higher-or-lower/
 More: https://www.spoj.com/problems/EKO/
 */
func guessNumber(_ n: Int) -> Int {
    if guess(1) == 0 { return 1 }
    var l = 1
    var r = n
    while r - l > 1 {
        let m = (l + r)/2
        if guess(m) <= 0 {
            r = m
        } else {
            l = m
        }
    }
    return r
}

func main() {
    let res = guessNumber(10)
    print(res)
}

main()
