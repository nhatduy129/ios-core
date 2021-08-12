//
//  MovieDetailViewController.swift
//  CS_iOS_Assignment
//
//  Created by Duy Nguyen on 31/7/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import UIKit

final class MovieDetailViewController: BaseViewController, UICollectionViewDelegateFlowLayout,
                                       UICollectionViewDataSource {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic_close"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sd_imageTransition = .fade
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.gray
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor(hex: 0x828282).cgColor
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(mbfont: .helveticaNeueBold, size: 14)
        label.textColor = UIColor(hex: 0xcdcdcd)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var releaseDateAndRuntimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(mbfont: .helveticaNeue, size: 12)
        label.textColor = UIColor(hex: 0xcdcdcd)
        return label
    }()
    
    private lazy var overviewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Overview"
        label.font = UIFont(mbfont: .helveticaNeueBold, size: 14)
        label.textColor = UIColor(hex: 0xcdcdcd)
        return label
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(mbfont: .helveticaNeue, size: 12)
        label.textColor = UIColor(hex: 0xcdcdcd)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(cellType: GenreCell.self)
        return collectionView
    }()
    
    private let viewModel: MovieDetailViewModel
    private var collectionViewHeightAnchor: NSLayoutConstraint?
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(closeButton)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(releaseDateAndRuntimeLabel)
        contentView.addSubview(overviewTitleLabel)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(collectionView)
        layoutConstraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionViewHeightAnchor?.isActive = false
        collectionViewHeightAnchor = collectionView.heightAnchor.constraint(equalToConstant: collectionView.contentSize.height)
        collectionViewHeightAnchor?.isActive = true
        view.layoutIfNeeded()
    }
    
    private func layoutConstraint() {
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 44),
            closeButton.heightAnchor.constraint(equalToConstant: 44),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.topAnchor.constraint(equalTo: closeButton.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            posterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 27/65),
            posterImageView.widthAnchor.constraint(equalTo: posterImageView.heightAnchor, multiplier: 135/201),
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 6),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            releaseDateAndRuntimeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            releaseDateAndRuntimeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            overviewTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            overviewTitleLabel.topAnchor.constraint(equalTo: releaseDateAndRuntimeLabel.bottomAnchor, constant: 20),
            overviewLabel.leadingAnchor.constraint(equalTo: overviewTitleLabel.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            overviewLabel.topAnchor.constraint(equalTo: overviewTitleLabel.bottomAnchor, constant: 20),
            collectionView.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
        collectionViewHeightAnchor = collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30)
        collectionViewHeightAnchor?.priority = UILayoutPriority(999)
        collectionViewHeightAnchor?.isActive = true
        collectionViewHeightAnchor = collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        collectionViewHeightAnchor?.priority = UILayoutPriority(998)
        collectionViewHeightAnchor?.isActive = true
    }
    
    private func setUpController() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        titleLabel.text = viewModel.getTitle()
        releaseDateAndRuntimeLabel.text = viewModel.getReleaseDateAndRuntime()
        overviewLabel.text = viewModel.getOverview()
        posterImageView.sd_setImage(with: viewModel.getPosterURL())
        //collectionView.reloadData()
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    // MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfGenres()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: GenreCell.self, for: indexPath)
        cell.genre = viewModel.getGenre(byIndex: indexPath.row)
        return cell
    }
}
