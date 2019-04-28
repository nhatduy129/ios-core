//
//  ViewController.swift
//  9.ConfigDemo
//
//  Created by Duy Nguyen on 28/4/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        imageView.sd_setImage(with: URL(string: "http://shareaccvn.com/comic/doremon/doremon_dai_tap1/cover.jpg"), completed: nil)
        view.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 300, y: 300, width: 100, height: 50))
        label.text = Bundle.main.infoDictionary!["demo"] as! String
        view.addSubview(label)
    }


}

