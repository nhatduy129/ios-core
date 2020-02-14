//
//  ViewController.swift
//  35.AddTextToImage
//
//  Created by Duy Nguyen on 19/1/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = imageView.image?.addText(drawText: "abc", atPoint: CGPoint(x: 60, y: 60))
    }


}

