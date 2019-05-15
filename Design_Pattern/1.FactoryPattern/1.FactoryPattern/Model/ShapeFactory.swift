//
//  ShapeFactory.swift
//  1.FactoryPattern
//
//  Created by Duy Nguyen on 15/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

enum Shapes {
    case square
    case circle
    case rectangle
}

class ShapeFactory {

    static func create(as shape: Shapes, on parentView: UIView) -> HelperViewFactoryProtocol {
        switch shape {
        case .square:
            let square = Square(parentView: parentView)
            return square
        case .circle:
            let circle = Circle(parentView: parentView)
            return circle
        case .rectangle:
            let rectangle = Rectangle(parentView: parentView)
            return rectangle
        }
    }
}

// Public factory method to display shapes.
//func createShape(_ shape: Shapes, on view: UIView) {
//    let shapeFactory = ShapeFactory(parentView: view)
//    shapeFactory.create(as: shape).display()
//}

// Alternative public factory method to display shapes.
// Technically, the factory method should return one of
// a number of related classes.
//func getShape(_ shape: Shapes, on view: UIView) -> HelperViewFactoryProtocol {
//    let shapeFactory = ShapeFactory(parentView: view)
//    return shapeFactory.create(as: shape)
//}
