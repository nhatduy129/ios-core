//
//  UIFont+.swift
//  MovieBox
//
//  Created by Duy Nguyen on 30/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import UIKit

// swiftlint:disable discouraged_direct_init
extension UIFont {
    enum MBFont: String {
        case helveticaNeue = "HelveticaNeue"
        case helveticaNeueBold  = "HelveticaNeue-Bold"
    }
    
    convenience init(mbfont: MBFont, size: CGFloat) {
        var size = size
        switch UIDevice().getDeviceModel() {
        case .iPhone8PlusAndLower:
            break
        case .iphoneXAndAbove:
            size += 2
        case .ipad:
            size += 4
        }
        self.init(name: mbfont.rawValue, size: size)!
    }
}
