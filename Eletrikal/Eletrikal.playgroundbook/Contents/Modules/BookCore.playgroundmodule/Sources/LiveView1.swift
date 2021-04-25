//
//  LiveView1.swift
//  BookCore
//
//  Created by Daniella Onishi on 17/04/21.
//

import Foundation
import PlaygroundSupport
import SpriteKit

public class LiveView1: SKScene {
    
    var background: SKSpriteNode!
    var panel: SKSpriteNode!
    var popUp: SKSpriteNode!
    lazy var lights = children
        .filter({($0.name ?? "").contains("light")})
        .compactMap({$0 as! SKLightNode})
    
    override public func didMove(to view: SKView) {
        
        background = SKSpriteNode(imageNamed: "liveview_background1")
        addChild(background)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        animateBackground()
        
        panel = SKSpriteNode(imageNamed: "liveviewpanel1")
        panel.position = CGPoint(x: 0, y: 0)
        addChild(panel)
        
        popUp = SKSpriteNode(imageNamed: "liveviewPopUp")
        panel.position = CGPoint(x: 0, y: 0)
        popUp.setScale(0.8)
        addChild(popUp)
        
       
    }
    
    func animateBackground() {
        
        SKAction.moveBy(x:0,y:0,duration:0.1)
        let move1 = SKAction.move(to: CGPoint(x: 30,y: 30),duration: 4)
        move1.timingMode = .easeInEaseOut
        let move2 = SKAction.move(to: CGPoint(x: 0,y: -10),duration: 4)
        move2.timingMode = .easeInEaseOut
        let move3 = SKAction.move(to: CGPoint(x: -30,y: 0),duration: 4)
        move3.timingMode = .easeInEaseOut
        let sequenceRepeat = SKAction.repeatForever(SKAction.sequence([move1, move2, move3]))
        background.run(sequenceRepeat)
        
        
       /* let rotate1 = SKAction.rotate(toAngle: 0.2, duration: 6)
        rotate1.timingMode = .easeInEaseOut
        let rotate2 = SKAction.rotate(toAngle: -0.2, duration: 6)
        rotate2.timingMode = .easeInEaseOut
        let rotateRepeat = SKAction.repeatForever(SKAction.sequence([rotate1, rotate2]))
        background.run(rotateRepeat)
        */
    }
    
    func animateLights() {
        let lightAction = SKAction.customAction(withDuration: 1.5) { (node, elapsedTime) in
            let light = node as! SKLightNode
            let proportion = elapsedTime / 1.5
            light.falloff = 5 * (1 - proportion)
        }
        
        lightAction.timingMode = .easeIn
        lights.forEach({$0.run(lightAction)})
    }
    
    
    @objc public static override var supportsSecureCoding: Bool {
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        animateLights()
    }
}


