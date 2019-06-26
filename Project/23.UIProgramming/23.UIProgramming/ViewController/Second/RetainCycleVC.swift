//
//  RetainCycleVC.swift
//  23.UIProgramming
//
//  Created by Duy Nguyen on 26/6/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class RetainCycleVC: UIViewController {

    var topView: UIView!
    
    override func loadView() {
        super.loadView()
        topView = UIView(frame: .zero)
        view.addSubview(topView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.backgroundColor = .red
    }
    
    deinit {
        print("RetainCycleVC is deallocated")
    }
}

//This implementation is not retain cycle.
//We should use weak var because avoid retain cycle, if we var in this case, it is ok. In other case, maybe problems.
