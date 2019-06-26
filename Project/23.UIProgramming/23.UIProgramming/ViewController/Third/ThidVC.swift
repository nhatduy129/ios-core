//
//  ThidVC.swift
//  23.UIProgramming
//
//  Created by Duy Nguyen on 26/6/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    weak var stackView: UIStackView!
    weak var view1: UIView!
    weak var view2: UIView!
    
    override func loadView() {
        super.loadView()
        addStackView1()
        addStackView2()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        stackView.backgroundColor = .lightGray
        view1.backgroundColor = .blue
        view2.backgroundColor = .green
    }
    
    func addStackView1() {
        let stackView = UIStackView()
        let view1 = UIView()
        let view2 = UIView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalToConstant: 80),
            view1.widthAnchor.constraint(equalToConstant: 100),
            view2.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        stackView.spacing = 20
        
        self.stackView = stackView
        self.view1 = view1
        self.view2 = view2
    }
    
    func addStackView2() {
        let stackView = UIStackView()
        let label1 = UILabel()
        let label2 = UILabel()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalToConstant: 80),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        label1.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label1.text = "nhat duy"
        label1.backgroundColor = .red
        label2.text = "nguyen vu nhat duy"
        label2.backgroundColor = .orange
    }
}
