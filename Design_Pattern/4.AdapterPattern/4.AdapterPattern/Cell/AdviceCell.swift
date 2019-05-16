//
//  AdviceCell.swift
//  4.AdapterPattern
//
//  Created by Duy Nguyen on 16/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class AdviceCell: UITableViewCell {

    var adviceLabel: UILabel
    var bottomConstraint: NSLayoutConstraint?
    var advice: Advice? {
        didSet {
            adviceLabel.text = advice?.title
        }
    }
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        adviceLabel = UILabel()
        adviceLabel.numberOfLines = 0
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Functionalities
    func initUI() {
        contentView.addSubview(adviceLabel)
        adviceLabel.translatesAutoresizingMaskIntoConstraints = false
        adviceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        adviceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        adviceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        bottomConstraint = adviceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        bottomConstraint?.isActive = true
    }
}
