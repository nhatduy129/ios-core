//
//  main.swift
//  2.DecoratorPattern
//
//  Created by Duy Nguyen on 15/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

func printPizza(pizza: Pizza) {
    print(pizza.getDescription() + ": \(pizza.getCost())" )
}

var peppyPaneer: Pizza = PeppyPaneer()
printPizza(pizza: peppyPaneer)
peppyPaneer = FreshTomato(pizza: peppyPaneer)
printPizza(pizza: peppyPaneer)
peppyPaneer = Barbeque(pizza: peppyPaneer)
printPizza(pizza: peppyPaneer)

print("----------------")

var farmHouse: Pizza = FarmHouse()
printPizza(pizza: farmHouse)

farmHouse = FreshTomato(pizza: farmHouse)
printPizza(pizza: farmHouse)
farmHouse = Barbeque(pizza: farmHouse)
printPizza(pizza: farmHouse)
farmHouse = FreshTomato(pizza: farmHouse)
printPizza(pizza: farmHouse)
