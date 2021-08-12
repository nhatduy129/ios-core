//
//  UITableView+.swift
//  CS_iOS_Assignment
//
//  Created by Duy Nguyen on 30/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import UIKit

// swiftlint:disable force_cast
extension UITableView {
    func registerClassWithClassName(cellType: UITableViewCell.Type) {
        let className = cellType.className
        register(cellType, forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCellWithClassName<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}
