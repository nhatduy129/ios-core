//
//  ViewController.swift
//  45.Mixpanel
//
//  Created by Duy Nguyen on 18/4/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import Mixpanel

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        // STEP 2a
        Mixpanel.mainInstance().identify(distinctId: "21787sdf")
        Mixpanel.mainInstance().people.set(properties: [ "$name":"Duy demo lan 2"])
        Mixpanel.mainInstance().track(event: "Logged in")
        Mixpanel.mainInstance().flush()
    }
    
    @IBAction func eventAButtonTapped(_ sender: Any) {
        // STEP 2b
        Mixpanel.mainInstance().track(event: "EVENT A",
                                      properties: ["genre" : "hip-hop", "duration in seconds": 42])
    }
}
