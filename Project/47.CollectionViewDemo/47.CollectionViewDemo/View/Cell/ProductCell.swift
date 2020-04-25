//
//  ProductCell.swift
//  47.CollectionViewDemo
//
//  Created by Duy Nguyen on 25/4/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
