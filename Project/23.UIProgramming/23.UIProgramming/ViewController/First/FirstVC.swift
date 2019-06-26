//
//  ViewController.swift
//  23.UIProgramming
//
//  Created by Duy Nguyen on 26/6/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    weak var topView: UIView!
    weak var button: UIButton!
    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.backgroundColor = .green
        button.setTitle("Go to Retain Cycle VC", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setupUI() {
        let topView = UIView()
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        let demoConstraint = topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        demoConstraint.priority = UILayoutPriority(rawValue: 999)
        NSLayoutConstraint.activate([
            demoConstraint,
            topView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            topView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        self.topView = topView
        self.button = button
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let vc = RetainCycleVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

