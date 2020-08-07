//
//  ViewController.swift
//  44.CloudFirestore
//
//  Created by Duy Nguyen on 16/4/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseRemoteConfig

class ViewController: UIViewController {
    let db = Firestore.firestore()
    let remoteConfig = RemoteConfig.remoteConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demoCloudFirestore()
        demoRemoteConfig()
    }
    
    private func demoCloudFirestore() {
        db.collection("coretest").document("a").getDocument(completion: { data, error in
            print(data?.data())
        })
    }
    
    private func demoRemoteConfig() {
        remoteConfig.fetch(completionHandler: {[weak self] status, error in
            guard let self = self, error == nil else { return }
            print("Got the value from Remote Config!")
            self.remoteConfig.activate(completion: {[weak self] result, error in
                guard let self = self, error == nil else { return }
                debugPrint(self.remoteConfig.configValue(forKey: "maintenance_demo").stringValue)
            })
        })
    }
}
