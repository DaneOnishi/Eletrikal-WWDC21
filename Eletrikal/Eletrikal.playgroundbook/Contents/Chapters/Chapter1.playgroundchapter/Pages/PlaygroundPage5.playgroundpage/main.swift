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
let scene = GameScene5(fileNamed: "GameScene5")!
scene.scaleMode = .aspectFill
sceneView.presentScene(scene)

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true
var addThermicalIsolation: Bool
var addDoubleGlassWindows: Bool
var addHeatRecoveryVentilation: Bool
//#-end-hidden-code

/*:
 # Thermical Isolation
 
Especially - but not only - in very cold countries, humans spend a lot of energy to keep their homes warm. Meanwhile, in countries of intense summer, it is common to install air conditioning to cool indoor environments. However, these devices are **huge** villains of energy consumption.

So, what can be done to avoid consuming so much energy without jeopardizing well-being?

This is where residential planning comes in, allowing the conservation of internal heat. There are lots of things we can do to achieve that, such as blocking exchanges of the internal and external environment, adding a layer of isolation to the walls, choosing double glass windows or even developing a system that optimizes house ventilation. All these measures help greatly and can be used together to achieve event better results


- Experiment:
 Want to know better how it works? Try changing the statements below from `false` to `true` and see how the energy efficiency changes!
 
 */

addThermicalIsolation = /*#-editable-code*/false/*#-end-editable-code*/
addDoubleGlassWindows = /*#-editable-code*/false/*#-end-editable-code*/
addHeatRecoveryVentilation = /*#-editable-code*/false/*#-end-editable-code*/


//#-hidden-code
scene.setIsolationLevel(ThermicalIsolation: addThermicalIsolation, DoubleGlassWindows: addDoubleGlassWindows, HeatRecoveryVentilation: addHeatRecoveryVentilation)
//#-end-hidden-code


