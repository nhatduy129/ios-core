//
//  ThirdVC.swift
//  13.WhenCanAccessOutlet
//
//  Created by Duy Nguyen on 10/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
