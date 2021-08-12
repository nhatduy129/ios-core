//
//  ViewController.swift
//  CS_iOS_Assignment
//
//  Copyright © 2019 Backbase. All rights reserved.
//

import UIKit
import Alamofire
import PullToRefreshKit
import SVProgressHUD

private enum MoviesListSection: Int {
    case playingNow, mostPopular
}

final class MoviesListViewController: BaseViewController, UITableViewDelegate,
                                      UITableViewDataSource, UICollectionViewDataSource,
                                      UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerClassWithClassName(cellType: MovieCell.self)
        tableView.registerClassWithClassName(cellType: PosterCollectionCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(hex: 0x212121)
        return tableView
    }()
    
    private let viewModel: MoviesListViewModel
    
    init(viewModel: MoviesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(tableView)
        layoutConstraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpController()
        setUpNavigationBar()
    }
    
    private func layoutConstraint() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setUpController() {
        tableView.configRefreshFooter(container: self) { [weak self] in
            guard let self = self else { return }
            self.viewModel.loadMoreMovies { [weak self] result in
                guard let self = self else { return }
                self.tableView.switchRefreshFooter(to: .normal)
                switch result {
                case .success:
                    self.tableView.reloadData()
                case .failure(let error):
                    self.showError(error, tryAgainHandler: nil)
                }
            }
        }
    }
    
    private func setUpNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor(hex: 0x212121)
        let logo = UIImage(named: "ic_moviebox")
        let imageView = UIImageView(image: logo)
        imageView.widthAnchor.constraint(equalToConstant: 155).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        navigationItem.titleView = imageView
    }
    
    private func goToMovieDetail(movieId id: Int) {
        SVProgressHUD.show()
        viewModel.getMovieDetail(movieId: id) { [weak self] result in
            SVProgressHUD.dismiss()
            guard let self = self else { return }
            switch result {
            case .success(let movieDetail):
                let viewModel = MovieDetailViewModel(movieDetail: movieDetail)
                let vc = MovieDetailViewController(viewModel: viewModel)
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            case .failure(let error):
                self.showError(error, tryAgainHandler: nil)
            }
        }
    }
    
    // MARK: - UITableView
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch MoviesListSection(rawValue: section) {
        case .playingNow:
            return "Playing now"
        case .mostPopular:
            return "Most popular"
        case .none:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.contentView.backgroundColor = UIColor(hex: 0x313131)
        headerView.textLabel?.textColor = UIColor(hex: 0xfcd052)
        headerView.textLabel?.font = UIFont(mbfont: .helveticaNeue, size: 12)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch MoviesListSection(rawValue: section) {
        case .playingNow:
            return 1
        case .mostPopular:
            return viewModel.getNumberOfMovies()
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch MoviesListSection(rawValue: indexPath.section) {
        case .playingNow:
            let cell = tableView.dequeueReusableCellWithClassName(with: PosterCollectionCell.self, for: indexPath)
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            return cell
        case .mostPopular:
            let cell = tableView.dequeueReusableCellWithClassName(with: MovieCell.self, for: indexPath)
            cell.movie = viewModel.getMovie(byIndex: indexPath.row)
            return cell
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch MoviesListSection(rawValue: indexPath.section) {
        case .playingNow:
            return PosterCell.size.height
        case .mostPopular:
            return UITableView.automaticDimension
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.getMovie(byIndex: indexPath.row)
        goToMovieDetail(movieId: movie.id)
    }
    
    // MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfPoster()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: PosterCell.self, for: indexPath)
        cell.poster = viewModel.getPoster(byIndex: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return PosterCell.size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.getPoster(byIndex: indexPath.row)
        goToMovieDetail(movieId: movie.id)
    }
}
