//
//  FirstTabVC.swift
//  1.LifeCycle
//
//  Created by Duy Nguyen on 3/4/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class FirstTabVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("FirstTabVC: viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FirstTabVC: viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("FirstTabVC: viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("FirstTabVC: viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("FirstTabVC: viewDidDisappear")
    }
    
    deinit {
        print("FirstTabVC: deinit")
    }
}

