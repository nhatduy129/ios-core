//
//  AdviceAdapterCell.swift
//  4.AdapterPattern
//
//  Created by Duy Nguyen on 16/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class AdviceAdapterCell: AdviceCell {
    
    // MARK: - Variables
    var playerView: UIView?
    
    // MARK: Initializations
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Functionalities
    func setAdapter(player: UIView) {
        playerView = player
        contentView.addSubview(playerView!)
        bottomConstraint?.isActive = false
        playerView!.translatesAutoresizingMaskIntoConstraints = false
        adviceLabel.bottomAnchor.constraint(equalTo: playerView!.topAnchor, constant: -10).isActive = true
        playerView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        playerView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        playerView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        playerView!.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
