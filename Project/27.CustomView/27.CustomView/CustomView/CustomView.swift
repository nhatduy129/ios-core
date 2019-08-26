//
//  CustomView.swift
//  27.CustomView
//
//  Created by Duy Nguyen on 18/8/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit


class CustomView: UIView {

    let label: UILabel
    
    override init(frame: CGRect) {
        label = UILabel()
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        label = UILabel()
        super.init(coder: aDecoder)
        initView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK - Private methods
extension CustomView {
    private func initView() {
        label.backgroundColor = .blue
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
        ])
        label.text = "Nguyen Vu Nhat Duy Nguyen Vu Nhat Duy Nguyen Vu Nhat Duy Nguyen Vu Nhat Duy"
    }
}
