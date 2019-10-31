//
//  ThirdViewController.swift
//  29.Demo
//
//  Created by Duy Nguyen on 24/9/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class HmletRating: UIControl {
    
    @IBInspectable
    var starHeight: CGFloat = 25
    
    @IBInspectable
    var rateEnable: Bool = true
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        for i in 1...5 {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(starButtonTapped), for: .touchDown)
            button.tag = i
            button.setImage(UIImage(named: "ic_star_unselected"), for: .normal)
            button.setImage(UIImage(named: "ic_star_selected"), for: .selected)
            switch rateEnable {
            case true:
                button.setImage(UIImage(named: "ic_star_selected"), for: .highlighted)
                button.setImage(UIImage(named: "ic_star_selected"), for: UIControl.State.selected.union(.highlighted))
            case false:
                button.adjustsImageWhenHighlighted = false
            }
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalTo: button.heightAnchor),
                ])
            stackView.addArrangedSubview(button)
        }
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        
        return stackView
    }()
    
    var rate: Int = 0 {
        didSet {
            for button in (stackView.subviews as! [UIButton]) {
                button.isSelected = button.tag <= rate
            }
            sendActions(for: .valueChanged)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: starHeight * 5 + stackView.spacing * 4),
            stackView.heightAnchor.constraint(equalToConstant: starHeight),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            //self.wid
        ])
    }
}

// MARK: - Actions
extension HmletRating {
    @objc private func starButtonTapped(_ sender: UIButton) {
        guard rateEnable == true else {
            sendActions(for: .touchUpInside)
            return
        }
        rate = sender.tag
    }
}

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func hmletRatingValueChanged(_ sender: HmletRating) {
        print("hmletRatingValueChanged rate: \(sender.rate)")
    }
    
    @IBAction func hmletRatingTapped(_ sender: HmletRating) {
        print("hmletRatingTapped rate: \(sender.rate)")
    }
}
