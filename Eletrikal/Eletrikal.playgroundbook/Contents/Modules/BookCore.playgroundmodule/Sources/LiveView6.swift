//
//  LiveView6.swift
//  BookCore
//
//  Created by Daniella Onishi on 18/04/21.
//

import Foundation
import SpriteKit

public class LiveView6: SKScene {
    
    var panel: SKSpriteNode!
    
    var background: SKSpriteNode!
    var popUp: SKSpriteNode!
    
    
    override public func didMove(to view: SKView) {
        
        background = SKSpriteNode(imageNamed: "liveview7")
        addChild(background)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
       
        
    }
}
