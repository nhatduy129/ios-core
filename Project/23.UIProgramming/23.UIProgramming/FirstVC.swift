//
//  ViewController.swift
//  23.UIProgramming
//
//  Created by Duy Nguyen on 26/6/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .blue
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        let topView = UIView()
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        topView.backgroundColor = .green
        
        let button = UIButton()
        button.setTitle("Go to Retain Cycle VC", for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let vc = RetainCycleVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

