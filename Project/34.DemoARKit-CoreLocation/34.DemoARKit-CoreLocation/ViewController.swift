//
//  ViewController.swift
//  34.DemoARKit-CoreLocation
//
//  Created by Duy Nguyen on 17/1/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import ARCL
import CoreLocation

class ViewController: UIViewController {

    var sceneLocationView = SceneLocationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneLocationView.run()
        view.addSubview(sceneLocationView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sceneLocationView.frame = view.bounds
    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            let arr = [
                (lat: 1.3073, long: 103.9013, imgName: "bcpb2"),
                (lat: 1.326436, long: 103.904993, imgName: "empressHotel"),
            ]
            for item in arr {
                let location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: item.lat, longitude: item.long), altitude: 30)
                let pin = UIImage(named: item.imgName)!
                let annotationNode = LocationAnnotationNode(location: location, image: pin)
                sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
            }
        }
}

