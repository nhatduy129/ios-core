//
//  Barbeque.swift
//  2.DecoratorPattern
//
//  Created by Duy Nguyen on 15/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

class Barbeque: Pizza {
    
    var pizza: Pizza
    
    init(pizza: Pizza) {
        self.pizza = pizza
    }
    
    func getDescription() -> String {
        return pizza.getDescription() + ", Barbeque"
    }
    
    func getCost() -> Int {
        return pizza.getCost() + 20
    }
}
