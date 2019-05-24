//
//  UIImageView+.swift
//  17.LoadAndCashImageUrl
//
//  Created by Duy Nguyen on 24/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadImage(url: URL) {
        ImageViewHelper.shared.loadImage(url: url, completed: {image in
            self.image = image
        })
    }
}
