//
//  BasicViewController.swift
//  46.StripeDemo
//
//  Created by Duy Nguyen on 19/4/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Stripe
import KRProgressHUD

class BasicViewController: UIViewController {

    lazy var cardTextField: STPPaymentCardTextField = {
        let cardTextField = STPPaymentCardTextField()
        return cardTextField
    }()
    lazy var payButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.setTitle("Pay", for: .normal)
        button.addTarget(self, action: #selector(pay), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [cardTextField, payButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 2),
            view.rightAnchor.constraint(equalToSystemSpacingAfter: stackView.rightAnchor, multiplier: 2),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 2),
        ])
    }

    @objc func pay() {
        KRProgressHUD.show()
        let url = URL(string: "https://sshhhh.herokuapp.com/api/v1/payment/create_payment_intent")!
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        request.addValue("eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwiZXhwIjoxNjE5MzUyOTgxfQ.Yg_G86kKq_1PHb0WMJLpnqcR8PxvYPgSYN35a5CbYIQ",
                         forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, res, error in
            KRProgressHUD.dismiss()
            guard let res = res as? HTTPURLResponse,
                res.statusCode == 200,
                let data = data,
                let json = (try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]),
                let clientSecret = json["client_secret"] as? String else {
                    return
            }
            self?.payment(paymentIntentClientSecret: clientSecret)
        }
        task.resume()
    }
    
    private func payment(paymentIntentClientSecret: String) {
        // Collect card details
        let cardParams = cardTextField.cardParams
        let paymentMethodParams = STPPaymentMethodParams(card: cardParams, billingDetails: nil, metadata: nil)
        let paymentIntentParams = STPPaymentIntentParams(clientSecret: paymentIntentClientSecret)
        paymentIntentParams.paymentMethodParams = paymentMethodParams

        // Submit the payment
        let paymentHandler = STPPaymentHandler.shared()
        paymentHandler.confirmPayment(withParams: paymentIntentParams, authenticationContext: self) { (status, paymentIntent, error) in
            switch (status) {
            case .failed:
                print("Payment failed")
                print(error?.localizedDescription ?? "")
                break
            case .canceled:
                print("Payment canceled")
                print(error?.localizedDescription ?? "")
                break
            case .succeeded:
                print("Payment succeeded")
                print(paymentIntent?.description ?? "")
                break
            @unknown default:
                fatalError()
                break
            }
        }
    }
}

extension BasicViewController: STPAuthenticationContext {
    func authenticationPresentingViewController() -> UIViewController {
        return self
    }
}
