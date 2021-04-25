//
//  GameScene5.swift
//  BookCore
//
//  Created by Daniella Onishi on 11/04/21.
//

import SpriteKit
import PlaygroundSupport
import AVFoundation

public class GameScene6: SKScene {
    
    var background: SKSpriteNode!
    var popUp: SKSpriteNode!
    var button: SKSpriteNode!
    var byeAnimation: SKAction!
    var eletrika: SKSpriteNode!
    var hand: SKSpriteNode!
    var music: AVAudioPlayer!
    
    override public func didMove(to view: SKView) {
        
        button = (childNode(withName: "button") as! SKSpriteNode)
        hand = (childNode(withName: "hand") as! SKSpriteNode)
        popUp = (childNode(withName: "baloon")as! SKSpriteNode)
        
        eletrika = (childNode(withName: "eletrika") as! SKSpriteNode)
        eletrika.anchorPoint = CGPoint(x:0.5, y: 0.7)
        createBye()
       
        
        let url: URL = Bundle.main.url(forResource: "ES_Bubble Blip 2 - SFX Producer", withExtension: "mp3")!
        music = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)

        music.numberOfLoops = 1
        music.volume = 0.3
        
    }
    
    func createBye() {
        var byeList = [SKTexture] ()
        
        byeList.append(SKTexture(imageNamed: "movement_2"))
        byeList.append(SKTexture(imageNamed: "movement_3"))
        byeList.append(SKTexture(imageNamed: "movement_4"))
        byeList.append(SKTexture(imageNamed: "movement_5"))
        byeList.append(SKTexture(imageNamed: "movement_4"))
        byeList.append(SKTexture(imageNamed: "movement_3"))
        byeList.append(SKTexture(imageNamed: "movement_2"))
        
        let bye = SKAction.animate(with: byeList,
                                   timePerFrame: 0.15,
                                   resize: true,
                                   restore: true)
        
        byeAnimation = SKAction.repeat(bye, count: 5)
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if button.contains(pos){
            eletrika.run(byeAnimation)
            waveHand()
            
            
            let wait = SKAction.wait(forDuration: 2)
            let appearPopUp = SKAction.fadeAlpha(by: 1, duration: 1.5)
            let sequence = SKAction.sequence([wait,appearPopUp])
            popUp.run(sequence)
            
            PlaygroundPage.current.assessmentStatus = .pass(message: "This is the end of our journey!")
            
        }
        
    }
    
    func waveHand() {
        let rotate1 = SKAction.rotate(toAngle: -0.50, duration: 1)
        rotate1.timingMode = .easeInEaseOut
        let rotate2 = SKAction.rotate(toAngle: 0.50, duration: 1)
        rotate2.timingMode = .easeInEaseOut
        let rotate3 = SKAction.rotate(toAngle: 0, duration: 1)
        rotate3.timingMode = .easeInEaseOut
        let rotateRepeat = SKAction.repeat(SKAction.sequence([rotate1, rotate2,rotate3]), count: 1)
        hand.run(rotateRepeat)
    }
    
    func playMusic() {
        if music.isPlaying {
            music.stop()
        }
      
      music.play()
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
        
        
    }
    
}











