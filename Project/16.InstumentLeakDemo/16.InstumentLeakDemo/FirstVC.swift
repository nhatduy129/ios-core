//
//  ViewController.swift
//  16.InstumentLeakDemo
//
//  Created by Duy Nguyen on 20/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Second VC", style: .plain, target: self, action: #selector(goToSecondVC))
    }
    
    @objc func goToSecondVC() {
        navigationController?.pushViewController(SecondVC(), animated: true)
    }
}

class Service {
    weak var vc: UIViewController?
    
    deinit {
        print("Service was deallocated")
    }
}

class SecondVC: UIViewController {
    
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: {_ in
//            print("Timer run.")
//        })
        
        service.vc = self
    }
    
    deinit {
        print("SecondVC was deallocated.")
    }
}
