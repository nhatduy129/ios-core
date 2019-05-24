//
//  ViewController.swift
//  17.LoadAndCashImageUrl
//
//  Created by Duy Nguyen on 24/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var arrImageView: [UIImageView]!
    
    let data = [
        "http://shareaccvn.com/comic/slider/slider1.jpg",
        "http://shareaccvn.com/comic/slider/slider2.jpg",
        "http://shareaccvn.com/comic/slider/slider3.jpg",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (idx, imageView) in arrImageView.enumerated() {
            if let url = URL(string: data[idx]) {
                imageView.loadImage(url: url)
            }
        }
    }
}

