//
//  ViewController.swift
//  14.GCD_NSOperation
//
//  Created by Duy Nguyen on 10/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func timerTask(_ str: String, _ cnt: Int) {
        if cnt == 20 {
            return
        }
        var i = 0
        while i < 100000000 {
            i += 1
        }
        print(str + " \(cnt)")
        timerTask(str, cnt + 1)
    }
    
    @IBAction func gcdButtonTapped(_ sender: UIButton) {
        DispatchQueue.global(qos: .background).async {[weak self] in
            self?.timerTask("gcd", 1)
        }
    }
    
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        let op = Operation()
        op.completionBlock = {[weak self] in
            self?.timerTask("Operation", 1)
        }
        op.start()
    }
    
    @IBAction func operationQueueButtonTapped(_ sender: UIButton) {
        let opQueue = OperationQueue()
        var arrOp = Array<Operation>()
        for i in 1...10 {
            let op = Operation()
            op.completionBlock = {[weak self] in
                self?.timerTask("Operation\(i)", 1)
            }
            arrOp.append(op)
        }
        opQueue.addOperations(arrOp, waitUntilFinished: true)
        opQueue.maxConcurrentOperationCount = 1
    }
    
    @IBAction func demoButtonTapped(_ sender: UIButton) {
        let q = DispatchQueue(label: "")
        q.async {
            DispatchQueue.main.sync {
                print("abc")
            }
        }
        for i in 0...10000 {
            if i.isMultiple(of: 3000) {
                print("DDD")
            }
        }
    }
}

