//
//  AdvanceViewController.swift
//  46.StripeDemo
//
//  Created by Duy Nguyen on 26/4/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Stripe
import KRProgressHUD

fileprivate class StripeKeyProvider: NSObject, STPCustomerEphemeralKeyProvider {
    static let shared = StripeKeyProvider()
    
    private override init() {}
    
    func createCustomerKey(withAPIVersion apiVersion: String, completion: @escaping STPJSONResponseCompletionBlock) {
        let url = URL(string: "https://sshhhh.herokuapp.com/api/v1/payment/ephemeral_keys")!
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = [URLQueryItem(name: "api_version", value: apiVersion)]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        request.addValue("eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwiZXhwIjoxNjE5MzUyOTgxfQ.Yg_G86kKq_1PHb0WMJLpnqcR8PxvYPgSYN35a5CbYIQ",
                         forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data,
                let json = ((try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]) as [String : Any]??) else {
                completion(nil, error)
                return
            }
            completion(json, nil)
        })
        task.resume()
    }
    
    func getClientSecret(completion: @escaping (Result<String, Error>) -> Void) {
        let url = URL(string: "https://sshhhh.herokuapp.com/api/v1/payment/create_payment_intent")!
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        request.addValue("eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwiZXhwIjoxNjE5MzUyOTgxfQ.Yg_G86kKq_1PHb0WMJLpnqcR8PxvYPgSYN35a5CbYIQ",
                         forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, res, error in
            guard let res = res as? HTTPURLResponse,
                res.statusCode == 200,
                let data = data,
                let json = (try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]),
                let clientSecret = json["client_secret"] as? String else {
                    completion(.failure(error!))
                    return
            }
            completion(.success(clientSecret))
        }
        task.resume()
    }
}

class AdvanceViewController: UIViewController, STPPaymentContextDelegate {
    private let paymentContext: STPPaymentContext
    private let customerContext: STPCustomerContext
    
    required init?(coder: NSCoder) {
        customerContext = STPCustomerContext(keyProvider: StripeKeyProvider.shared)
        paymentContext = STPPaymentContext(customerContext: customerContext)
        super.init(coder: coder)
        paymentContext.delegate = self
        paymentContext.hostViewController = self
    }
    
    // MARK: - Actions
    @IBAction func selectPaymentMethod(_ sender: UIButton) {
        self.paymentContext.presentPaymentOptionsViewController()
    }
    
    @IBAction func payButtonTapped(_ sender: UIButton) {
        paymentContext.requestPayment()
    }
    
    // MARK: - STPPaymentContextDelegate
    func paymentContext(_ paymentContext: STPPaymentContext, didFailToLoadWithError error: Error) {
        print(error)
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didCreatePaymentResult paymentResult: STPPaymentResult, completion: @escaping STPPaymentStatusBlock) {
        KRProgressHUD.show()
        StripeKeyProvider.shared.getClientSecret { res in
            KRProgressHUD.dismiss()
            switch res {
            case .success(let clientSecret):
                let paymentIntentParams = STPPaymentIntentParams(clientSecret: clientSecret)
                paymentIntentParams.paymentMethodId = paymentResult.paymentMethod?.stripeId
                // Confirm the PaymentIntent
                STPPaymentHandler.shared().confirmPayment(withParams: paymentIntentParams, authenticationContext: paymentContext) { status, paymentIntent, error in
                    switch status {
                    case .succeeded:
                        // Your backend asynchronously fulfills the customer's order, e.g. via webhook
                        completion(.success, nil)
                    case .failed:
                        completion(.error, error) // Report error
                    case .canceled:
                        completion(.userCancellation, nil) // Customer cancelled
                    @unknown default:
                        completion(.error, nil)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didFinishWith status: STPPaymentStatus, error: Error?) {
        print(error)
    }
    
    func paymentContextDidChange(_ paymentContext: STPPaymentContext) {
        print(paymentContext)
    }
}
