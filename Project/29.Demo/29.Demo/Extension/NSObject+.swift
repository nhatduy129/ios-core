//
//  NSObject+.swift
//  29.Demo
//
//  Created by Duy Nguyen on 11/9/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}

