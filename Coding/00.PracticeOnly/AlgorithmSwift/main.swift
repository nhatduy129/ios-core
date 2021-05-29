//
//  main.swift
//  AlgorithmSwift
//
//  Created by Duy Nguyen on 28/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Foundation

// dieu kien position[i+1] - position[i] >= abs(height[i+1] - height[i])
// mud = so luong mud o giua
// gap = don vi wall heigh chenh lech

// if gap <= mud + 1
// do some thing
// else return 0

//
func maxHeight(wallPositions: [Int], wallHeights: [Int]) -> Int {
    var result = 0
    for i in 0..<(wallPositions.count - 1) {
        let gap = abs(wallHeights[i] - wallHeights[i+1])
        var numberOfSlots = wallPositions[i+1] - wallPositions[i] - 1
        var ans = 0
        if numberOfSlots == 0 {
            ans = 0
        } else if gap > numberOfSlots + 1 || gap == numberOfSlots - 1 {
            ans = min(wallHeights[i], wallHeights[i+1]) + numberOfSlots
        } else {
            numberOfSlots += numberOfSlots.isMultiple(of: 2) ? 0 : 1
            let bonus = (numberOfSlots + gap) / 2
            ans = min(wallHeights[i], wallHeights[i+1]) + bonus
        }
        result = max(result, ans)
    }
    return result
}

print(maxHeight(wallPositions: [1, 4],
                wallHeights: [1, 2]))
