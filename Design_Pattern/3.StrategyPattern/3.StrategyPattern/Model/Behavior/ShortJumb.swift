//
//  ShortJumb.swift
//  3.StrategyPattern
//
//  Created by Duy Nguyen on 16/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

class ShortJumb: Jumb {
    func makeJumb() {
        print("ShortJumb")
    }
    
    deinit {
        print("LongJumb is deallocated")
    }
}
