//
//  Square.swift
//  1.FactoryPattern
//
//  Created by Duy Nguyen on 15/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class Square: HelperViewFactoryProtocol {
    
    let height: Int
    let parentView: UIView
    var view: UIView
    
    init(height: Int = defaultHeight, parentView: UIView) {
        self.height = height
        self.parentView = parentView
        view = UIView()
    }
    
    func configure() {
        let frame = CGRect(x: 0, y: 0, width: height, height: height)
        view.frame = frame
        view.backgroundColor = defaultColor
    }
    
    func position() {
        view.center = parentView.center
    }
    
    func display() {
        configure()
        position()
        parentView.addSubview(view)
    }
}
