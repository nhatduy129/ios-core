//
//  ViewController.swift
//  47.CollectionViewDemo
//
//  Created by Duy Nguyen on 25/4/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("Title", for: .normal)
        return button
    }()
    
    private var data = [
        Product(title: "GCP Professional Cloud Network Engineer", price: 8.0, backgroundColor: .blue),
        Product(title: "GCP alsdkjfl Cloudl akjsla kks k laler", price: 19.5, backgroundColor: UIColor(hex: 0x4FD400)),
        Product(title: "GCP Professional Cloud Network Engineer", price: 20, backgroundColor: UIColor(hex: 0xF7B500)),
        Product(title: "Internet Internet Internet Internet Engineer", price: 12, backgroundColor: UIColor(hex: 0x0B9AF5)),
        Product(title: "Internet Internet Internet Internet Engineer", price: 4.56, backgroundColor: UIColor(hex: 0xF7B500)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ProductCell")
        // Do any additional setup after loading the view.
    }
    
    // MARK: - CollectionView Data Sourde
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.view.backgroundColor = data[indexPath.row].backgroundColor
        cell.titleLabel.text = data[indexPath.row].title
        cell.priceLabel.text = "\(data[indexPath.row].price)"
        return cell
    }
    
    // MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) is selected")
    }
}

