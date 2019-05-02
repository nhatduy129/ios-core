import UIKit

let button = UIButton()
let tableView = UITableView()
let label = UILabel()

for view in [button, tableView, label] {
    if view.self is UIView {
        print(true)
    }
}

