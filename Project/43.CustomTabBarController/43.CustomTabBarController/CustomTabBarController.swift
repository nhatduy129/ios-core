//
//  CustomTabBarController.swift
//  43.CustomTabBarController
//
//  Created by Duy Nguyen on 3/4/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // update first item
        
        //self.setSelection(item: self.tabBar.selectedItem!)
        
    }

    // MARK: - UITabBarDelegate handlers

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        clearSelections()
        setSelection(item: item)
    }

    // MARK: - Selection Methods
    func setSelection(item:UITabBarItem) {
            for i in 0..<self.tabBar.items!.count {
                let ii = self.tabBar.items![i]
                if(item == ii) {
                    let sv = self.tabBar.subviews[i+1]
                    //let label:UILabel =  sv.subviews[1] as! UILabel
                    //print("didSelectItem \(label.text) = \(ii.title)")
                    sv.backgroundColor = .red // Selection color
                }
            }
    }

    func clearSelections() {
        for s in tabBar.subviews {
            s.backgroundColor = .clear
        }
    }
}

