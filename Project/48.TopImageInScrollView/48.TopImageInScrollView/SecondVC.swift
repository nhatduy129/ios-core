//
//  SecondVC.swift
//  48.TopImageInScrollView
//
//  Created by Duy Nguyen on 17/7/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class SecondVC: UIViewController, UIScrollViewDelegate {
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        let navigationBarHeight = navigationController?.navigationBar.frame.size.height ?? 0
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        scrollView.contentInset = UIEdgeInsets(top: -(navigationBarHeight + statusBarHeight),
                                               left: 0, bottom: 0, right: 0)
        scrollView.delegate = self
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y > 0 { return }
//        var scale = 1.0 + abs(scrollView.contentOffset.y)  / scrollView.frame.size.height
//            scale = max(0.0, scale)
//        self.imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
//    }
}
