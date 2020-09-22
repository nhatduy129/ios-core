//
//  ViewController.swift
//  52.Timer
//
//  Created by Duy Nguyen on 19/9/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    private var timer: Timer?
//    private var count = 0
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    @IBAction func startTimerButtonTapped(_ sender: Any) {
//        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
////        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {_ in
////            self.timerAction()
////        }
//    }
//
//    @IBAction func stopTimerButtonTapped(_ sender: Any) {
//        timer?.invalidate()
//    }
//
//    @objc func timerAction() {
//        count += 1
//        print(count)
//    }
    //var count = 0
    let timer: RepeatingTimer = {
        let timer = RepeatingTimer(timeInterval: TimeInterval(exactly: 0.5)!)
        timer.eventHandler = {
            print("ss")
        }
        return timer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.resume()
    }
}

class RepeatingTimer {
    let timeInterval: TimeInterval
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    private lazy var timer: DispatchSourceTimer = {
        let t = DispatchSource.makeTimerSource()
        t.schedule(deadline: .now() + self.timeInterval, repeating:                             self.timeInterval)
        t.setEventHandler(handler: { [weak self] in
            self?.eventHandler?()
        })
        return t
    }()
    var eventHandler: (() -> Void)?
    private enum State {
        case suspended
        case resumed
    }
    private var state: State = .suspended
    func resume() {
        if state == .resumed {
            return
        }
        state = .resumed
        timer.resume()
    }
    
    func suspend() {
        if state == .suspended {
            return
        }
        state = .suspended
        timer.suspend()
    }
}
