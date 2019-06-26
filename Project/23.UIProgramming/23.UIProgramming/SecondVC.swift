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
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("...")
    }
    
    func setupUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
