//
//  AdviceFatoryCell.swift
//  4.AdapterPattern
//
//  Created by Duy Nguyen on 16/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

enum AdviceCellType {
    case none
    case audio
    case video
    
    static func getType(advice: Advice) -> AdviceCellType {
        if advice.audioUrl != nil {
            return .audio
        } else if advice.videoUrl != nil {
            return .video
        } else {
            return .none
        }
    }
}
//
//class AdviceFatoryCell {
//    
//    static func create(advice: Advice) -> UITableViewCell {
//        switch AdviceCellType.getType(advice: advice) {
//        case .none:
//            <#code#>
//        case .audio:
//        case .video:
//        }
//    }
//}
