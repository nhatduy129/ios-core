//
//  CustomViewA.swift
//  29.Demo
//
//  Created by Duy Nguyen on 10/9/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class CustomViewA: UIView {
    
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //print("frame: \(frame)")
        //print("run in init(frame: CGRect)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("label: \(label)")
        print("run in required init?(coder..)")
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        print("label: \(label)")
        print("run in willMove")
    }
    
    override func invalidateIntrinsicContentSize() {
        super.invalidateIntrinsicContentSize()
        print("label: \(label)")
        print("run in invalidateIntrinsicContentSize")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        print("label: \(label)")
        print("run in didMoveToSuperview")
    }
    
    override func awakeFromNib() {
        print("label: \(label)")
        super.awakeFromNib()
        print("label: \(label)")
        print("run in awakeFromNib")
    }
}
