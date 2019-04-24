//
//  main.swift
//  Coding
//
//  Created by Duy Nguyen on 21/4/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

var path: [Int:Int]!

func cal(_ n: Int, _ m: Int, _ k: Int) -> Int {
    if path.keys.contains(k) == false {
        return m
    }
    return m + cal(k, n*m/k, path[k]!)
}

// Complete the stoneDivision function below.
func stoneDivision(n: Int, s: [Int]) -> Int {
    var s = s.sorted(by: <)
    path = [Int:Int]()
    var level = Array(repeating: 1, count: 1000)
    for i in stride(from: 0, to: s.count, by: 1) {
        for j in stride(from: i+1, to: s.count, by: 1) {
            if s[j] % s[i] == 0 && level[j] <= level[i] {
                level[j] = level[i] + 1
                path[s[j]] = s[i]
            }
        }
    }
    
    var mx = 0
    for i in s {
        if n % i == 0 && n != i {
            mx = max(mx, cal(n, 1, i))
        }
    }
    return mx
}

//var ans = stoneDivision(n: 64, s: [2, 4, 8, 16, 64])
//print(ans)
//
var ans = stoneDivision(n: 1, s: [1,2])
print(ans)
//
//ans = stoneDivision(n: 6, s: [3])
//print(ans)

 ans = stoneDivision(n: 64, s: [2, 4, 8 ,16, 32, 64])
print(ans)
