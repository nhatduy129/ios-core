//
//  ViewController.swift
//  38.SimpleAR
//
//  Created by Duy Nguyen on 29/2/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import MapKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        self.sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.sceneView.session.pause()
    }
    
    @IBAction func addNodeButtonTapped(_ sender: UIButton) {
        let path: UIBezierPath = {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0.1, y: 0.5))
            path.addLine(to: CGPoint(x: 0.1, y: 0.1))
            path.addLine(to: CGPoint(x: 0.3, y: 0.1))
            path.addLine(to: CGPoint(x: -0.1, y: -0.5))
            path.addLine(to: CGPoint(x: -0.1, y: -0.1))
            path.addLine(to: CGPoint(x: -0.3, y: -0.1))
            path.close()
            return path
        }()
        let shape: SCNShape = {
            let shape = SCNShape(path: path, extrusionDepth: 0.01)
            shape.firstMaterial?.diffuse.contents = UIColor.yellow
            shape.chamferRadius = 0.1
            return shape
        }()
        let boltNode = SCNNode(geometry: shape)
        boltNode.eulerAngles = SCNVector3(degreesToRadians(90), 0, 0)
        boltNode.position.z = 1
        sceneView.scene.rootNode.addChildNode(boltNode)
    }
    
    @IBAction func addPolylineButtonTapped(_ sender: UIButton) {
        //let polyline = MKPolyline(coordinates: <#T##UnsafePointer<CLLocationCoordinate2D>#>, count: <#T##Int#>)
        
    }
    
    @IBAction func addPolygonButtonTapped(_ sender: UIButton) {
        
    }
    
    func degreesToRadians(_ d: Double) -> Double {
        return d * .pi / 180
    }
}
