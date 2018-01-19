//
//  ViewController.swift
//  worldTracking
//
//  Created by Mac User on 28/11/17.
//  Copyright © 2017 Mac User. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //It shows us the world origin and feature points
        //World is starting position
        self.sceneView.debugOptions=[ARSCNDebugOptions.showFeaturePoints,
        ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting=true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: Any) {
          let node=getRandomShape();
         self.sceneView.scene.rootNode.addChildNode(node)
        //CREATES BEZIERS
//        let node=SCNNode()
//        let myColor=getRandomColor()
//        let path=UIBezierPath()
//        path.move(to: CGPoint(x:0,y:0))
//        path.addLine(to: CGPoint(x:0,y:0.2))
//        path.addLine(to: CGPoint(x:0.2,y:0.3))
//        path.addLine(to: CGPoint(x:0.4,y:0.2))
//        path.addLine(to: CGPoint(x:0.4,y:0.0))
//        let shape=SCNShape(path:path, extrusionDepth:0.2)
//        node.geometry=shape
//        node.geometry?.firstMaterial?.specular.contents=UIColor.white
//        node.geometry?.firstMaterial?.diffuse.contents=myColor
//        self.sceneView.scene.rootNode.addChildNode(node)
       
//        //CREATES A HOUSE, RELATIVE ROTATIONS
//        let doorNode=SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
//        let boxNode=SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
//        boxNode.geometry?.firstMaterial?.diffuse.contents=UIColor.red
//        let node=SCNNode()
//
//        doorNode.geometry?.firstMaterial?.diffuse.contents=UIColor.brown
//
//        node.geometry=SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
//        node.geometry?.firstMaterial?.specular.contents=UIColor.white
//        node.geometry?.firstMaterial?.diffuse.contents=UIColor.blue
//
//
//        node.position=SCNVector3(0.2,0.3,-0.2)
//        node.eulerAngles=SCNVector3(90.degreesToRadians,0,0)
//
//        boxNode.position=SCNVector3(0.0,-0.05,0.0)
//        doorNode.position=SCNVector3(0,0,0.053)
//
//        self.sceneView.scene.rootNode.addChildNode(node)
//        node.addChildNode(boxNode)
//        boxNode.addChildNode(doorNode)
        //self.sceneView.scene.rootNode.addChildNode(cylinderNode)
        
        //ROTATIONS
//        let node=SCNNode(geometry: SCNPlane(width: 0.3, height: 0.3))
//        node.geometry?.firstMaterial?.specular.contents=UIColor.white
//        node.geometry?.firstMaterial?.diffuse.contents=UIColor.blue
//        node.position=SCNVector3(0,0,-0.3)
//        node.eulerAngles=SCNVector3(0,90.degreesToRadians,0)
//        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    func getRandomShape() -> SCNNode{
        //Geo node
        let node=SCNNode()
        let myColor=getRandomColor()
        
        //Random number for selecting shape
        let shapeNumber=Int(randomNumbers(firstNum: 1, secondNum: 9))
        
        switch shapeNumber {
        case 1:
            node.geometry=SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
            node.geometry?.firstMaterial?.specular.contents=UIColor.white
            node.geometry?.firstMaterial?.diffuse.contents=myColor
        case 2:
            node.geometry=SCNSphere(radius: 0.1)
            node.geometry?.firstMaterial?.specular.contents=UIColor.white
            node.geometry?.firstMaterial?.diffuse.contents=myColor
        case 3:
            node.geometry=SCNTube(innerRadius: 0.2, outerRadius: 0.3, height: 0.5)
            node.geometry?.firstMaterial?.specular.contents=UIColor.white
            node.geometry?.firstMaterial?.diffuse.contents=myColor
        case 4:
            node.geometry=SCNTorus(ringRadius: 0.3, pipeRadius: 0.1)
            node.geometry?.firstMaterial?.specular.contents=UIColor.white
            node.geometry?.firstMaterial?.diffuse.contents=myColor
        case 5:
            node.geometry=SCNPlane(width: 0.2, height: 0.2)
            node.geometry?.firstMaterial?.specular.contents=UIColor.white
            node.geometry?.firstMaterial?.diffuse.contents=myColor
        case 6:
            node.geometry=SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
            node.geometry?.firstMaterial?.specular.contents=UIColor.white
            node.geometry?.firstMaterial?.diffuse.contents=myColor
        case 7:
            let path=UIBezierPath()
            path.move(to: CGPoint(x:0,y:0))
            path.addLine(to: CGPoint(x:0,y:0.2))
            let shape=SCNShape(path:path, extrusionDepth:0.2)
            node.geometry=shape
            node.geometry?.firstMaterial?.specular.contents=UIColor.white
            node.geometry?.firstMaterial?.diffuse.contents=myColor
        default:
            node.geometry=SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius:0.03)
            node.geometry?.firstMaterial?.specular.contents=UIColor.white
            node.geometry?.firstMaterial?.diffuse.contents=myColor
        }
        
        
        let x=randomNumbers(firstNum: -1.5, secondNum: 0.3)
        let y=randomNumbers(firstNum: -1.5, secondNum: 0.3)
        let z=randomNumbers(firstNum: -1.5, secondNum: 0.3)
        
        node.position=SCNVector3(x,y,z)
        
        return node
    }
    
    func getRandomColor()->UIColor{
        
        let colorNumber=Int(randomNumbers(firstNum: 1, secondNum: 9))
        var myColor=UIColor.blue
        
        switch colorNumber {
        case 1:
            myColor=UIColor.cyan
        case 2:
            myColor=UIColor.green
        case 3,8,9:
            myColor=UIColor.magenta
        case 4:
            myColor=UIColor.orange
        case 5:
            myColor=UIColor.purple
        case 6:
            myColor=UIColor.red
        case 7:
            myColor=UIColor.yellow
      
        default:
            myColor=UIColor.blue
        }
        
        return myColor
    }
    
    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
    
    func restartSession(){
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options:[.resetTracking,.removeExistingAnchors])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }

}

extension Int {
    
    var degreesToRadians: Double { return Double(self) * .pi/180}
}

