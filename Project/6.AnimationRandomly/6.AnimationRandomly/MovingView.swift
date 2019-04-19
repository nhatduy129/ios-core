//
//  MovingView.swift
//  6.AnimationRandomly
//
//  Created by Duy Nguyen on 19/4/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class MovingView: UIView {

    func startMovingRandomly() {
        let path = UIBezierPath()
        path.move(to: center)
        path.addCurve(to: CGPoint(x: 200, y: 200), controlPoint1: CGPoint(x: 100, y: 500), controlPoint2: CGPoint(x: 300, y: 200))
        path.addCurve(to: center, controlPoint1: CGPoint(x: 0, y: 19), controlPoint2: CGPoint(x: 300, y: 20))
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = path.cgPath
        anim.repeatCount = Float(Int.max)
        anim.duration = 5.0
        layer.add(anim, forKey: "move")
    }
}
