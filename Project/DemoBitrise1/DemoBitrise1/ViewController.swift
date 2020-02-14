//
//  ViewController.swift
//  DemoBitrise1
//
//  Created by Duy Nguyen on 28/11/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    var image: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image.sd_setImage(with: URL(string: "https://image.shutterstock.com/image-photo/mountains-during-sunset-beautiful-natural-600w-407021107.jpg"))
    }
}

