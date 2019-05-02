//
//  ViewController.swift
//  11.ImageViewAppearAnimation
//
//  Created by Duy Nguyen on 2/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeImageButtonTapped(_ sender: Any) {
        UIView.transition(with: imageView,
                          duration: 0.15,
                          options: .transitionCrossDissolve,
                          animations: {
                            if self.flag {
                                self.imageView.image = #imageLiteral(resourceName: "slider2")
                            } else {
                                self.imageView.image = #imageLiteral(resourceName: "slider1")
                            }
                            self.flag = !self.flag
        },
                          completion: nil)
    }
}

