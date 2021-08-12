//
//  GenreCell.swift
//  CS_iOS_Assignment
//
//  Created by Duy Nguyen on 31/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import UIKit

final class GenreCell: UICollectionViewCell {
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(mbfont: .helveticaNeue, size: 8)
        return label
    }()
    
    var genre: Genre? {
        didSet {
            nameLabel.text = genre?.name?.uppercased()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    private func initSubviews() {
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6)
        ])
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 4
        contentView.layer.masksToBounds = true
    }
}
