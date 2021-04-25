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
if let scene = GameScene6(fileNamed: "GameScene6") {
    scene.scaleMode = .aspectFill
    sceneView.presentScene(scene)
}

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true

//#-end-hidden-code

/*:
 # End
 
 Hey, before we part ways I wanna leave some tips that you can use to continue to improve energy efficiency on your home:
 
 - Important: You can make some substitutions in your daily routine. How about on cold day use another layer of blanket instead of turning on the heating? And on hot days,open the windows instead of running to the air conditioner?
 ---
 - Important: A big consumer of energy is the shower, so spending less time in the bath is an excellent alternative!
 ---
 - Important: Turning off all the lights when you are not using them is  simple but very effective
 

 */

 
