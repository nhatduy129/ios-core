//
//  main.swift
//  AlgorithmSwift
//
//  Created by Duy Nguyen on 28/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Foundation

func alarmClock(setTime: String, timeToSet: String) -> Int {
    let a = setTime.split(separator: ":")
    let aH = Int(a[0])!, aM = Int(a[1])!
    let b = timeToSet.split(separator: ":")
    let bH = Int(b[0])!, bM = Int(b[1])!
    var h = 0, m = 0
    if bH > aH {
        let tmp = 23 - bH + aH + 1
        h = min(bH - aH, tmp)
    } else if bH < aH {
        let tmp = 23 - aH + bH + 1
        h = min(aH - bH, tmp)
    }
    if bM > aM {
        let tmp = 59 - bM + aM + 1
        m = min(bM - aM, tmp)
    } else if bM < aM {
        let tmp = 59 - aM + bM + 1
        m = min(aM - bM, tmp)
    }
    return h + m
}

print(alarmClock(setTime: "07:30", timeToSet: "08:00"))
