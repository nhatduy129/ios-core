//
//  PeppyPaneer.swift
//  2.DecoratorPattern
//
//  Created by Duy Nguyen on 15/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

class PeppyPaneer: Pizza {
    func getDescription() -> String {
        return "PeppyPaneer"
    }
    
    func getCost() -> Int {
        return 100
    }
}
