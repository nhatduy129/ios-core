//
//  ChickenFiesta.swift
//  2.DecoratorPattern
//
//  Created by Duy Nguyen on 15/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

class ChickenFiesta: Pizza {
    func getDescription() -> String {
        return "ChickenFiesta"
    }
    
    func getCost() -> Int {
        return 300
    }
}
