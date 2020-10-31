//
//  main.swift
//  06.Stack
//
//  Created by Duy Nguyen on 31/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//
// Link: https://leetcode.com/problems/valid-parentheses/

import Foundation

func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    let dict: [Character: Character] = [
        "(": ")",
        "{": "}",
        "[": "]",
    ]
    for i in s {
        if i == "(" || i == "{" || i == "[" {
            stack.append(i)
        } else {
            guard let last = stack.popLast() else { return false }
            if i != dict[last] { return false }
        }
    }
    return stack.isEmpty
}

func main() {
    let res = isValid("()")
    print(res)
}

main()
