//
//  Circle.swift
//  1.FactoryPattern
//
//  Created by Duy Nguyen on 15/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

class Circle: Square {
    
    override func configure() {
        super.configure()
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.masksToBounds = true
    }
}
