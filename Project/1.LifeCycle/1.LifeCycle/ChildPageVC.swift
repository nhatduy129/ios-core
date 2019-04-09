//
//  ChildPageVC.swift
//  1.LifeCycle
//
//  Created by Duy Nguyen on 3/4/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ChildPageVC: UIViewController {

    @IBOutlet private weak var timerLabel: UILabel!
    var cnt: Int = 0
    var myTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ChildPageVC: viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ChildPageVC: viewWillAppear")
        
        //Nếu dùng [unowned self] thì về cơ bản có thể gỡ được strong reference và deinit sẽ được gọi, tuy nhiên sẽ bị crash vì closure vẫn tiếp tục được gọi, do đó crash ở dòng "self.cnt += 1" vì self lúc này là nil
        //Nếu dùng [weak self], bên trong dùng self?, cách này OK, gỡ được strong reference và ko bị crash, tuy nhiên, closure vẫn bị gọi đi gọi lại
        //Chính vì vậy phải code như bên dưới, sử dụng guard let là best practice.
//        Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: {[weak self] timer in
//            guard let `self` = self else {
//                timer.invalidate()
//                return
//            }
//            self.cnt += 1
//            self.timerLabel.text = "\(String(describing: self.cnt))"
//        })
        weak var weakSelf = self
        myTimer = Timer.scheduledTimer(timeInterval: 3, target: weakSelf!, selector: #selector(timeCount), userInfo: nil, repeats: true)
    }
    
    @objc func timeCount() {
        self.cnt += 1
        self.timerLabel.text = "\(String(describing: self.cnt))"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ChildPageVC: viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ChildPageVC: viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //myTimer?.invalidate()
        print("ChildPageVC: viewDidDisappear")
    }
    
    deinit {
        print("ChildPageVC: deinit")
    }
}

