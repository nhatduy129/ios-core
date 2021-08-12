//
//  SceneDelegate.swift
//  CS_iOS_Assignment
//
//  Copyright © 2019 Backbase. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private lazy var rootViewController: UIViewController = {
        let viewModel = SplashScreenViewModel()
        let vc = SplashScreenViewController(viewModel: viewModel)
        let navigationController = MBNavigationController(rootViewController: vc)
        return navigationController
    }()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window = self.window
    }
}
