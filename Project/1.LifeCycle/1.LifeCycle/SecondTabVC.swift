//
//  SecondTabVCTabVC.swift
//  1.LifeCycle
//
//  Created by Duy Nguyen on 3/4/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondTabVC: UIViewController {
    
    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondTabVC: viewDidLoad")
        let tap = UITapGestureRecognizer(target: self, action: #selector(testViewClicked(_:)))
        testView.isUserInteractionEnabled = true
        testView.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondTabVC: viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondTabVC: viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondTabVC: viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondTabVC: viewDidDisappear")
    }
    
    deinit {
        print("SecondTabVC: deinit")
    }
    
    @objc func testViewClicked(_ sender: UITapGestureRecognizer) {
        print("con cac")
    }
}

