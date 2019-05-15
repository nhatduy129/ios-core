//
//  Rectangle.swift
//  1.FactoryPattern
//
//  Created by Duy Nguyen on 15/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class Rectangle : Square {
    
    override func configure() {
        let frame = CGRect(x: 0, y: 0, width: height + height/2, height: height)
        view.frame = frame
        view.backgroundColor = UIColor.blue
    }
}
