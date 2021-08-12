//
//  MovieCell.swift
//  CS_iOS_Assignment
//
//  Created by Duy Nguyen on 30/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import UIKit
import SDWebImage

final class MovieCell: UITableViewCell {
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sd_imageTransition = .fade
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.gray
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(hex: 0x828282).cgColor
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont(mbfont: .helveticaNeueBold, size: 14)
        label.textColor = UIColor(hex: 0xcdcdcd)
        return label
    }()
    
    lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(mbfont: .helveticaNeue, size: 12)
        label.textColor = UIColor(hex: 0xcdcdcd)
        return label
    }()
    
    lazy var originalLanguageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(mbfont: .helveticaNeue, size: 12)
        label.textColor = UIColor(hex: 0xcdcdcd)
        return label
    }()
    
    lazy var ratingView: RatingView = {
        let view = RatingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var movie: Movie? {
        didSet {
            guard let movie = movie else { return }
            posterImageView.sd_setImage(with: movie.getPosterThumbnailURL())
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDate?.toString(format: "MMMM d, yyyy")
            originalLanguageLabel.text = movie.originalLanguage
            ratingView.rating = movie.voteAverage
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    private func initSubviews() {
        selectionStyle = .none
        contentView.backgroundColor = UIColor(hex: 0x212121)
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(originalLanguageLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(ratingView)
        layoutConstraint()
    }
    
    private func layoutConstraint() {
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            posterImageView.widthAnchor.constraint(equalToConstant: 49),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 18),
            titleLabel.trailingAnchor.constraint(equalTo: ratingView.leadingAnchor),
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            releaseDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            originalLanguageLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 2),
            originalLanguageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            originalLanguageLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            ratingView.heightAnchor.constraint(equalToConstant: 38),
            ratingView.widthAnchor.constraint(equalToConstant: 38),
            ratingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            ratingView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        let posterImageViewHeightAnchor = posterImageView.heightAnchor.constraint(equalToConstant: 73)
        posterImageViewHeightAnchor.priority = UILayoutPriority(999)
        posterImageViewHeightAnchor.isActive = true
        let posterImageViewBottomAnchor = posterImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        posterImageViewBottomAnchor.priority = UILayoutPriority(999)
        posterImageViewBottomAnchor.isActive = true
    }
}
