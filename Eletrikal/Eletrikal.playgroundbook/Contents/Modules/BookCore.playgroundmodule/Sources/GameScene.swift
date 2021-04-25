import SpriteKit
import AVFoundation
import PlaygroundSupport

public class GameScene: SKScene {
    
    var background1: SKSpriteNode!
    var popUp: SKSpriteNode!
    var scale: SKAction!
    var music: AVAudioPlayer!
    var tapOnScreen: SKSpriteNode!
    var atmospherePopUp: SKSpriteNode!
    var ranScaleOnePointSeven = false
    lazy var lights = children
        .filter({($0.name ?? "").contains("light")})
        .compactMap({$0 as! SKLightNode})
    

    override public func didMove(to view: SKView) {
        
        popUp = SKSpriteNode(imageNamed:"cardstart")
        popUp.position = CGPoint(x: 0, y: 0)
        popUp.setScale (0.50)
        popUp.zPosition = 10
        self.addChild(popUp)
        
        background1 = (childNode(withName: "background_1") as! SKSpriteNode)
        tapOnScreen = (childNode(withName: "taponscreen")as! SKSpriteNode)
        atmospherePopUp = (childNode(withName: "atmosphere_pop_up") as! SKSpriteNode)
        
        tapOnScreen.setScale(0.8)
        
        
       
       
        
        playMusic()
       // landingOnEarth()
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if popUp.contains(pos) && popUp.alpha == 1 {
            popUp.run(.fadeOut(withDuration: 0.2))
            
    
            SKAction.moveBy(x:0,y:0,duration:0.1)
            let move1 = SKAction.move(to: CGPoint(x: 50,y: 40),duration: 2)
            move1.timingMode = .easeInEaseOut
            let move2 = SKAction.move(to: CGPoint(x: 0,y: -80),duration: 2)
            move2.timingMode = .easeInEaseOut
            let move3 = SKAction.move(to: CGPoint(x: -60,y: 0),duration: 2)
            move3.timingMode = .easeInEaseOut
            let sequenceRepeat = SKAction.repeatForever(SKAction.sequence([move1, move2, move3]))
            background1.run(sequenceRepeat)
            
            let scale1 = SKAction.scale(by: 3, duration: 2)
            scale1.timingMode = .easeInEaseOut
            background1.run(scale1) {
                let sequence = [SKAction.fadeAlpha(by: 1, duration: 1), SKAction.wait(forDuration: 1)]
                
                self.tapOnScreen.run(SKAction.sequence(sequence))
                
            }
            
            
            let rotate1 = SKAction.rotate(toAngle: 0.18, duration: 2)
            rotate1.timingMode = .easeInEaseOut
            let rotate2 = SKAction.rotate(toAngle: -0.18, duration: 2)
            rotate2.timingMode = .easeInEaseOut
            let rotateRepeat = SKAction.repeatForever(SKAction.sequence([rotate1, rotate2]))
            background1.run(rotateRepeat)

        
        } else if tapOnScreen.contains(pos) && tapOnScreen.alpha == 1 {
            tapOnScreen.run(.fadeOut(withDuration: 0.2))
            let scale1 = SKAction.scale(by: 5, duration: 8)
            scale1.timingMode = .easeInEaseOut
            background1.run(scale1)
            
        
        }
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
    
    func playMusic() {
        let url: URL = Bundle.main.url(forResource: "audio-1", withExtension: "m4a")!
        music = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)

      music.numberOfLoops = 1
      music.prepareToPlay()
      music.volume = 0.3
      music.play()
    }
    
    
    
    /*func landingOnEarth() {
        tapOnScreen.alpha = 0
        let tapToEarth = SKAction.fadeAlpha(by: 0, duration: 8)
        let taptoEarth2 = SKAction.fadeAlpha(by: 1, duration: 6)
        tapToEarth.timingMode = .easeInEaseOut
        let appears = SKAction.sequence([tapToEarth, taptoEarth2])
        tapOnScreen.run(appears)
     }
        */
        
    

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
    
        
      
       if background1.xScale >= 1.7{
            
            let sequence = [SKAction.fadeAlpha(by: 1, duration: 1), SKAction.wait(forDuration: 1)]

            atmospherePopUp.run(SKAction.sequence(sequence))
        } else {
            atmospherePopUp.alpha = 0
        
        }
  
        if background1.xScale >= 1.7 && ranScaleOnePointSeven == false {
                        
            ranScaleOnePointSeven = true
            animateLights()
            
            PlaygroundPage.current.assessmentStatus = .pass(message: "Let's continue our journey on the [next page](@next)!")
            

        
        }
    }
}
 

 


  


    
    

