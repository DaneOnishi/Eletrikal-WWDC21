//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//


import PlaygroundSupport
import SpriteKit
import UIKit
import BookCore

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 768))
if let scene = GameScene3(fileNamed: "GameScene3") {
    scene.scaleMode = .aspectFit
    sceneView.presentScene(scene)
}

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true

//#-end-hidden-code

/*:
 # Eolic Energy
 
 
 Did you know that we can transform even wind in electricity? You might wonder: but how? Well, it’s quite simple. Wind is a very strong force of nature and **full** of energy. When it hits a wind turbine and rotates the blades, they transform this force into electricity.
 
  - Experiment: Tap run my code, blow near your microphone and see what happens!
 ---
  - Important: This page requires the microphone to work as intended, so please allow it  :)

 
 */

 
