//
//  GameScene5.swift
//  BookCore
//
//  Created by Daniella Onishi on 11/04/21.
//

// criar cena
// estado inicial isolado = false
// se tiver isolamento termico nas paredes, janelas de vidro duplo, circulador de calor = isolado


import SpriteKit
import PlaygroundSupport

public class GameScene5: SKScene {
    
    var home: SKSpriteNode!
    var isolated: SKSpriteNode!
    var nonIsolated: SKSpriteNode!
    var brick: SKSpriteNode!
    var glassWindow: SKSpriteNode!
    var heatRecovery: SKSpriteNode!
    var houseStatus: SKSpriteNode!
    var level1: SKSpriteNode!
    var level2: SKSpriteNode!
    var level3: SKSpriteNode!
    
    override public func didMove(to view: SKView) {
        
        home = (childNode(withName: "home") as! SKSpriteNode)
        isolated = (childNode(withName: "isolated") as! SKSpriteNode)
        nonIsolated = (childNode(withName: "non_isolated") as! SKSpriteNode)
        
        brick = (childNode(withName: "brick_false") as! SKSpriteNode)
        glassWindow = (childNode(withName: "glasswindow_false") as! SKSpriteNode)
        heatRecovery = (childNode(withName: "heatrecovery_false") as! SKSpriteNode)
        
        houseStatus = (childNode(withName: "house_status") as! SKSpriteNode)
       
                  
        
        home.alpha = 0
        isolated.alpha = 0
    }
    
    public func setIsolationLevel(ThermicalIsolation: Bool, DoubleGlassWindows: Bool, HeatRecoveryVentilation: Bool) {
        var level = CGFloat(0)
        var messageCount = 0
        
        if ThermicalIsolation {
            level += 0.3
            brick.texture = SKTexture(imageNamed: "brick_true")
            messageCount += 1
        }
        
        if DoubleGlassWindows {
            level += 0.35
            glassWindow.texture = SKTexture(imageNamed: "glasswindow_true")
            messageCount += 1
        }
        
        if HeatRecoveryVentilation {
            level += 0.35
            heatRecovery.texture = SKTexture(imageNamed: "heatrecovery_true")
            messageCount += 1
        }
        
        if messageCount <= 1{
            houseStatus.texture = SKTexture(imageNamed: "wasting")
            
            
        } else if messageCount == 2 {
            houseStatus.texture = SKTexture(imageNamed: "itsbetter")
            
        } else {
            houseStatus.texture = SKTexture(imageNamed: "nolonger")
        }
        
        isolated.alpha = level
        nonIsolated.alpha = 1 - level
        
        if DoubleGlassWindows && HeatRecoveryVentilation && ThermicalIsolation {
            PlaygroundPage.current.assessmentStatus = .pass(message: "The house is completely isolated and we are no longer wasting energy! Let's go to the [next page](@next)!")
        }
    }
}
    




