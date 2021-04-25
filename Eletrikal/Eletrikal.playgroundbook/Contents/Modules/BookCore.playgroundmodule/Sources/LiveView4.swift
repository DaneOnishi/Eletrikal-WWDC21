//
//  LiveView4.swift
//  BookCore
//
//  Created by Daniella Onishi on 18/04/21.
//

import Foundation
import PlaygroundSupport
import SpriteKit

public class LiveView4: SKScene {
    
    var background: SKSpriteNode!
    var popUp: SKSpriteNode!
    var placeHolder: SKSpriteNode!
    
    
    override public func didMove(to view: SKView) {
        
        background = SKSpriteNode(imageNamed: "liveview5")
        addChild(background)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.setScale(0.79)
       
       
    }
}
