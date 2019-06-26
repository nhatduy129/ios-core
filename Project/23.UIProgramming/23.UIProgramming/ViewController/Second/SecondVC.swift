//
//  SecondVC.swift
//  23.UIProgramming
//
//  Created by Duy Nguyen on 26/6/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    weak var tableView: UITableView!
    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//        initUI()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("...")
//    }
    
    override func loadView() {
        super.loadView()
        initUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func initUI() {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        tableView.register(SecondCell.self, forCellReuseIdentifier: "\(SecondCell.self)")
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView = tableView
    }
    
    func setupUI() {
        
    }
}

extension SecondVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SecondCell.self)") as! SecondCell
        return cell
    }
}
