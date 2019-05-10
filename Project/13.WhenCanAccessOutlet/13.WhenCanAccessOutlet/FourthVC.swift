//
//  FourthVC.swift
//  13.WhenCanAccessOutlet
//
//  Created by Duy Nguyen on 10/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class FourthVC: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let className = "FourthCell"
        let nib = UINib(nibName: className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: className)
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FourthCell") as! FourthCell
        cell.label.text = "cell thu \(indexPath.row)"
        return cell
    }
}
