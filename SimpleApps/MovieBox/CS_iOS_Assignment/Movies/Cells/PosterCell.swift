//
//  PosterCell.swift
//  CS_iOS_Assignment
//
//  Created by Duy Nguyen on 30/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import UIKit
import SDWebImage

final class PosterCell: UICollectionViewCell {
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sd_imageTransition = .fade
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var poster: Movie? {
        didSet {
            guard let poster = poster else { return }
            posterImageView.sd_setImage(with: poster.getPosterThumbnailURL())
        }
    }
    
    static let size = CGSize(width: 106, height: 160)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    private func initSubviews() {
        contentView.addSubview(posterImageView)
        layoutConstraint()
    }
    
    private func layoutConstraint() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: PosterCell.size.width),
            posterImageView.heightAnchor.constraint(equalToConstant: PosterCell.size.height)
        ])
    }
}
