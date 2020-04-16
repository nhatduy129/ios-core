//
//  ViewController.swift
//  44.CloudFirestore
//
//  Created by Duy Nguyen on 16/4/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        db.collection("coretest").document("a").getDocument(completion: { data, error in
            print(data?.data())
        })
    }
}
