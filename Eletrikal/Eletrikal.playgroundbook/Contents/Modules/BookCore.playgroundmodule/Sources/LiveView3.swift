//
//  LiveView3.swift
//  BookCore
//
//  Created by Daniella Onishi on 18/04/21.
//

import Foundation
import PlaygroundSupport
import SpriteKit

public class LiveView3: SKScene {
    
    var background: SKSpriteNode!
    var popUp: SKSpriteNode!
    
    
    override public func didMove(to view: SKView) {
        
        background = SKSpriteNode(imageNamed: "liveview3")
        addChild(background)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.setScale(0.79)
       
    }
}

        


