//
//  SplashScreenViewController.swift
//  MovieBox
//
//  Created by Duy Nguyen on 30/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import UIKit
import Alamofire

final class SplashScreenViewController: BaseViewController {
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ic_moviebox")
        return imageView
    }()
    
    private lazy var ghostNavigationBarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 155).isActive = true
        return imageView
    }()
    
    let dispatchGroup = DispatchGroup()
    private var logoImageViewConstraints: [NSLayoutConstraint]?
    private var window: UIWindow? {
        if let scene = UIApplication.shared.connectedScenes.first,
           let sceneDelegate = scene.delegate as? SceneDelegate {
            return sceneDelegate.window
        }
        return nil
    }
    private let viewModel: SplashScreenViewModel
    
    init(viewModel: SplashScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        window?.addSubview(logoImageView)
        layoutConstraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoAnimation()
    }
    
    private func layoutConstraint() {
        guard let window = window, window.subviews.contains(logoImageView) else { return }
        logoImageViewConstraints = [
            logoImageView.centerYAnchor.constraint(equalTo: window.centerYAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: window.widthAnchor, multiplier: 2/3),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: 155/19)
        ]
        NSLayoutConstraint.activate(logoImageViewConstraints ?? [])
    }
    
    private func setUpController() {
        view.backgroundColor = UIColor(hex: 0x212121)
        navigationItem.titleView = ghostNavigationBarImageView
        dispatchGroup.enter()  // Enter for logo Animation in viewDidAppear
        fetchData()
    }
    
    private func fetchData() {
        dispatchGroup.enter()
        var viewController: MoviesListViewController?
        var error: AFError?
        viewModel.fetchMoviesAndPosters { [weak self] result in
            switch result {
            case .success(let data):
                let viewModel = MoviesListViewModel(movies: data.movies, poster: data.posters)
                viewController = MoviesListViewController(viewModel: viewModel)
            case .failure(let err):
                error = err
            }
            self?.dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            if let error = error {
                self.showError(error) { [weak self] _ in
                    self?.fetchData()
                }
            } else if let vc = viewController {
                self.navigationController?.viewControllers = [vc]
            }
        }
    }
    
    private func logoAnimation() {
        UIView.animate(withDuration: 0.5,
                       animations: { [unowned self] in
                        guard let window = self.window else { return }
                        NSLayoutConstraint.deactivate(self.logoImageViewConstraints ?? [])
                        let newFrame = ghostNavigationBarImageView.frame
                        let statusBarHeight = self.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
                        NSLayoutConstraint.activate([
                            self.logoImageView.widthAnchor.constraint(equalToConstant: newFrame.width),
                            self.logoImageView.heightAnchor.constraint(equalToConstant: newFrame.height),
                            self.logoImageView.topAnchor.constraint(equalTo: window.topAnchor, constant: newFrame.minY + statusBarHeight),
                            self.logoImageView.centerXAnchor.constraint(equalTo: window.centerXAnchor)
                        ])
                        window.layoutIfNeeded()
                       },
                       completion: { _ in
                        self.dispatchGroup.leave()
                       })
    }
}
