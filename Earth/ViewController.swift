//
//  ViewController.swift
//  Earth
//
//  Created by Narek Arsenyan on 15.09.21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let result = sceneView.hitTest(touch.location(in: sceneView), types: .featurePoint)
        guard let hitResult = result.last else { return }
        let hitMatrix = hitResult.worldTransform
        let matrix = SCNMatrix4(hitMatrix)
        let hitVector = SCNVector3.init(x: matrix.m41, y: matrix.m42, z: matrix.m43)
        createEarth(position: hitVector)
    }
    
    func createEarth(position: SCNVector3) {
        let earthShape = SCNSphere(radius: 0.2)
        let earthNode = SCNNode(geometry: earthShape)
        earthNode.position = position
        earthNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "diffusePic")
        earthNode.geometry?.firstMaterial?.specular.contents = UIImage(named: "specularPic")
        earthNode.geometry?.firstMaterial?.emission.contents = UIImage(named: "cloudsPic")
        earthNode.geometry?.firstMaterial?.normal.contents = UIImage(named: "normalPic")
        sceneView.scene.rootNode.addChildNode(earthNode)
    }

    // MARK: - ARSCNViewDelegate
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
