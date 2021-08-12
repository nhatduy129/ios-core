//
//  NSObject+.swift
//  CS_iOS_Assignment
//
//  Created by Duy Nguyen on 28/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
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
