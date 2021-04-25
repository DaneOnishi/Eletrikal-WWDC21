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
import AVFoundation

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 768))
if let scene = GameScene2(fileNamed: "GameScene2") {
    scene.scaleMode = .aspectFill
    sceneView.presentScene(scene)
}

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true

//#-end-hidden-code

/*:

 
 # Clean Resources

 First, let's learn about some resources for generating clean and renewable energy that we can use in our homes!

 But wait, what is clean energy? **Clean energy is energy that does not release polluting gases into the atmosphere**, such as carbon dioxide (CO2), which is extremely harmful to the ozone layer and consequently accelerates global warming.

 We are about to deal with Solar Energy! It's generated by the sun rays on photovoltaic cells - an electronic circuit capable of capturing them and transforming them into electricity!
 
 Can you help me install this solar panel? It needs to be on the right angle to **capture as much sun rays as possible!**

 
  */

 
