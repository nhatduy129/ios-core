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
        createShape(.square, on: view)
    }
    
    @IBAction func circleButtonTapped(_ sender: Any) {
        createShape(.circle, on: view)
    }
    
    @IBAction func rectangleButtonTapped(_ sender: Any) {
        let shape = getShape(.rectangle, on: view)
        shape.display()
        //Or use
        //createShape(.rectangle, on: view)
    }
}

