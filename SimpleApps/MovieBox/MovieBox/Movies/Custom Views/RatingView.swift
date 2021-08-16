//
//  RatingView.swift
//  MovieBox
//
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class RatingView: UIView {
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(mbfont: .helveticaNeueBold, size: 12)
        return label
    }()
    
    private lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: 0xcdcdcd)
        label.font = UIFont(mbfont: .helveticaNeue, size: 4)
        label.text = "%"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    var rating: Double? {
        didSet {
            guard let rating = rating else { return }
            ratingLabel.text = String(Int(rating * 10))
            layer.sublayers?.removeAll(where: { $0.isMember(of: CAShapeLayer.self) })
            drawCircle()
            drawRatingCircle()
        }
    }
    
    private func initSubviews() {
        backgroundColor = UIColor(hex: 0x091519)
        layer.cornerRadius = 19
        layer.masksToBounds = true
        addSubview(ratingLabel)
        addSubview(percentLabel)
        layoutConstraint()
    }
    
    private func layoutConstraint() {
        NSLayoutConstraint.activate([
            ratingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            ratingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            percentLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor),
            percentLabel.topAnchor.constraint(equalTo: ratingLabel.topAnchor, constant: 2)
        ])
    }
    
    private func drawCircle() {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 19,
                                                         y: 19),
                                      radius: 20,
                                      startAngle: -0.5 * .pi,
                                      endAngle: .pi * 1.5,
                                      clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = getCircleColor(alpha: 0.2)?.cgColor
        shapeLayer.lineWidth = 10.0
        layer.addSublayer(shapeLayer)
    }
    
    private func drawRatingCircle() {
        guard let rating = rating else { return }
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 19,
                                                         y: 19),
                                      radius: 20,
                                      startAngle: -0.5 * .pi,
                                      endAngle: .pi * CGFloat(rating) / 5 - 0.5 * .pi,
                                      clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = getCircleColor()?.cgColor
        shapeLayer.lineWidth = 10.0
        layer.addSublayer(shapeLayer)
    }
    
    func getCircleColor(alpha: CGFloat = 1) -> UIColor? {
        guard let rating = rating else { return nil }
        return UIColor(red: 1 - CGFloat(rating) * 0.1,
                       green: 1, blue: 26/255,
                       alpha: alpha)
    }
}
