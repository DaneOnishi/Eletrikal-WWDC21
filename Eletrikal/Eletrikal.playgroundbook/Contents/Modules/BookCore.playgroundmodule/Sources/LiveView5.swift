//
//  LiveView5.swift
//  BookCore
//
//  Created by Daniella Onishi on 18/04/21.
//

import Foundation
import PlaygroundSupport
import SpriteKit

public class LiveView5: SKScene {
   
    var background: SKSpriteNode!
    
   
    
    
    override public func didMove(to view: SKView) {
        
        background = SKSpriteNode(imageNamed: "liveview6")
        addChild(background)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.setScale(0.79)
    
        

    }
}

