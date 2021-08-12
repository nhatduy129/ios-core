//
//  UIDevice+.swift
//  CS_iOS_Assignment
//
//  Created by Duy Nguyen on 30/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import UIKit

// swiftlint:disable discouraged_direct_init
enum FUIDeviceModel {
    case iPhone8PlusAndLower
    case iphoneXAndAbove
    case ipad
}

extension UIDevice {
    func getDeviceModel() -> FUIDeviceModel {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136, 1334, 1920, 2208:
                return .iPhone8PlusAndLower
            case 2436, 2688, 1792:
                return .iphoneXAndAbove
            default:
                return .iphoneXAndAbove
            }
        }
        return .ipad
    }
}
