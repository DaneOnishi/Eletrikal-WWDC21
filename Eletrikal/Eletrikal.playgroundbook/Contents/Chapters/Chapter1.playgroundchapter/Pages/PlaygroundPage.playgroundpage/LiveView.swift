//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import PlaygroundSupport
import SpriteKit
import BookCore

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 512, height: 778))
let scene = LiveView1(size: CGSize(width: 512, height: 778))
    // Set the scale mode
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)


PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
