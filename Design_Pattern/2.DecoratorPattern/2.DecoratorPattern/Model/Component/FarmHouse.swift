//
//  FarmHouse.swift
//  2.DecoratorPattern
//
//  Created by Duy Nguyen on 15/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

class FarmHouse: Pizza {
    func getDescription() -> String {
        return "FarmHouse"
    }
    
    func getCost() -> Int {
        return 200
    }
}
