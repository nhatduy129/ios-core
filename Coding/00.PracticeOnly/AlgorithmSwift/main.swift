//
//  main.swift
//  AlgorithmSwift
//
//  Created by Duy Nguyen on 28/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Foundation

class Person {
    func diAn() {
        print("di an")
    }
}

extension Person {
    @objc func uongNuoc() {
        print("di an")
    }
}

class Animal: Person {
    override func uongNuoc() {
        print("abc")
    }
}
