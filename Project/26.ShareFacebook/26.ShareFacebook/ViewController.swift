//
//  ViewController.swift
//  26.ShareFacebook
//
//  Created by Duy Nguyen on 4/8/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import FBSDKShareKit

class ViewController: UIViewController {

    @IBAction func showShareDialogButtonTapped(_ sender: Any) {
        let content = ShareLinkContent()
        content.contentURL = URL(string: "https://ShareAccVN.com/ads/2comic")!
        ShareDialog.init(fromViewController: self, content: content, delegate: nil).show()
        
    }
}

