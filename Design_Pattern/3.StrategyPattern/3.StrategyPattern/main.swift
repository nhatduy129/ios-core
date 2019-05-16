//
//  main.swift
//  3.StrategyPattern
//
//  Created by Duy Nguyen on 16/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

let rabit = Rabit()
let dog = Dog()

rabit.setJumb(jumb: LongJumb())
dog.setJumb(jumb: ShortJumb())
rabit.makeJumb()
dog.makeJumb()

rabit.setJumb(jumb: MediumJumb())
rabit.makeJumb()
