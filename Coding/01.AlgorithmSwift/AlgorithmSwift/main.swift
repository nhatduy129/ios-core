//
//  main.swift
//  AlgorithmSwift
//
//  Created by Duy Nguyen on 28/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Foundation

struct Student {
    var ten: String = ""
    var tuoi: Int = 0
}

extension Student {
    init(ten: String) {
        self.ten = ten
        self.tuoi = 0
    }
    
    func cc() {
        print("cc")
    }
}

func main() {
    let arr = [
        Student(ten: "lk", tuoi: 1),
        Student(ten: "lksd")
    ]
    arr[0].cc()
}

main()
