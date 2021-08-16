//
//  BaseViewController.swift
//  MovieBox
//
//  Created by Duy Nguyen on 28/7/21.
//  Copyright © 2021 Duy Nguyen. All rights reserved.
//

import UIKit
import Alamofire

class BaseViewController: UIViewController {
    deinit {
        print("\(self.className) is deallocated")
    }
    
    func showError(_ error: AFError, tryAgainHandler: ((UIAlertAction) -> Void)?) {
        if let tryAgainHandler = tryAgainHandler {
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: tryAgainHandler))
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}
