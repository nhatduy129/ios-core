//
//  Animal.swift
//  3.StrategyPattern
//
//  Created by Duy Nguyen on 16/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

protocol Animal {
    var jumb: Jumb? { get }
    
    func setJumb(jumb: Jumb)
    func makeJumb()
}
