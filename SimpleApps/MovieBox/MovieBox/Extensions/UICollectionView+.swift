//
//  UICollectionView+.swift
//  MovieBox
//
//  Created by Duy Nguyen on 30/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import UIKit

// swiftlint:disable force_cast
public extension UICollectionView {
    func registerClass(cellType: UICollectionViewCell.Type) {
        let className = cellType.className
        register(cellType, forCellWithReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type,
                                                      for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
