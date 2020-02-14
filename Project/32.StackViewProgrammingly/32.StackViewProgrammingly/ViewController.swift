//
//  ViewController.swift
//  32.StackViewProgrammingly
//
//  Created by Duy Nguyen on 11/12/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.backgroundColor = .orange
        return stackView
    }()
    
    lazy var imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "cc")
        return imageView
    }()
    
    lazy var imageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "cc")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(stackView)
        self.view.backgroundColor = .yellow
        stackView.addArrangedSubview(imageView1)
        stackView.addArrangedSubview(imageView2)
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.stackView.heightAnchor.constraint(equalToConstant: 180),
            
            self.imageView1.widthAnchor.constraint(equalTo: self.imageView2.widthAnchor),
        ])
    }
}

