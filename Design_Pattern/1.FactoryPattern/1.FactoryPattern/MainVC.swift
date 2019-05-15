//
//  ViewController.swift
//  1.FactoryPattern
//
//  Created by Duy Nguyen on 15/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func squareButtonTapped(_ sender: Any) {
        ShapeFactory.create(as: .square, on: view).display()
    }
    
    @IBAction func circleButtonTapped(_ sender: Any) {
        ShapeFactory.create(as: .circle, on: view).display()
    }
    
    @IBAction func rectangleButtonTapped(_ sender: Any) {
        //Or use
        ShapeFactory.create(as: .rectangle, on: view).display()
    }
}

