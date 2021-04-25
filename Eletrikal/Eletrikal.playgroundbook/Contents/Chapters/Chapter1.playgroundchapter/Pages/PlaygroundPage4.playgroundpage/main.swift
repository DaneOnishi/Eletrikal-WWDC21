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
if let scene = GameScene4(fileNamed: "GameScene4") {
    scene.scaleMode = .aspectFill
    sceneView.presentScene(scene)
}

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true




//#-end-hidden-code

/*:
 # Energy Waste
 
 Great! Now we know how to generate clean energy. How can we make the best use of it?

 This is energy efficiency, using less energy to perform tasks that previously could have spent a lot of kilowatt-hour

 - Note: Kilowatt-hour or kWh is an measurement unity that calculates the amount of electricity that is being used in one hour

 Many inevitable activities in our daily lives are driven by electricity, such as using the washing machine and refrigerating your food. However, we can make **smart choices** when buying electronics. The same goal can be achieved using much less energy, depending on the equipment we get.

One great example are lamps! They all illuminate the darkness, but **choosing the right model directly impact the consumption**



 */

 
