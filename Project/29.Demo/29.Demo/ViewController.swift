//
//  ViewController.swift
//  29.Demo
//
//  Created by Duy Nguyen on 10/9/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let a = CustomViewA()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(cellType: CustomCellA.self)
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: CustomCellA.self, for: indexPath)
        return cell
    }
}
