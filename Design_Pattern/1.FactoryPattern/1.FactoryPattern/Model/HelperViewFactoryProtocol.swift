//
//  HelperViewFactoryProtocol.swift
//  1.FactoryPattern
//
//  Created by Duy Nguyen on 15/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

let defaultHeight = 200
let defaultColor = UIColor.blue

protocol HelperViewFactoryProtocol {
    
    func configure()
    func position()
    func display()
    var height: Int { get }
    var view: UIView { get }
    var parentView: UIView { get }
}
