//
//  GameScene2.swift
//  BookCore
//
//  Created by Daniella Onishi on 10/04/21.



import SpriteKit
import PlaygroundSupport
import AVFoundation

public class GameScene2: SKScene {
    
    var background2: SKSpriteNode!
    
    var meterTop: SKSpriteNode!
    var meterMiddle: SKSpriteNode!
    var meterBottom: SKSpriteNode!
    var solarPanelBase: SKSpriteNode!
    
    var originalTopY: CGFloat!
    var originalMiddleHeight: CGFloat! // Dani do Futuro: definimos essa variavel aki pra kaso alteremo a gamescene.sks o código utilizar o novo valor, o mesmo se aplica pra linha 16!!
    var originalMiddleYScale: CGFloat!
    
    var buttonUp: SKSpriteNode!
    var buttonDown: SKSpriteNode!
    
    var solarPanelAngle: CGFloat = -30
    let maxSolarPanelAngle: CGFloat = 45
    let minSolarPanelAngle: CGFloat = -30
    
    let minMeterHeight: CGFloat = 1
    let maxMeterHeight: CGFloat = 130
    var solarPanel: SKSpriteNode!
    
    var sun: SKSpriteNode!
    var lightPoint: SKSpriteNode!
    
    var music: AVAudioPlayer!
    
    
    override public func didMove(to view: SKView) {
        meterTop = (childNode(withName: "meter_top") as! SKSpriteNode)
        meterMiddle = (childNode(withName: "meter_middle") as! SKSpriteNode)
        
        buttonUp = (childNode(withName: "rotate_up") as! SKSpriteNode)
        buttonDown = (childNode(withName: "rotate_down") as! SKSpriteNode)
        
        solarPanel = (childNode(withName: "solarpanel") as! SKSpriteNode)
        solarPanelBase = (childNode(withName: "solarpanelbase") as! SKSpriteNode)
        lightPoint = (childNode(withName: "lightpoint") as! SKSpriteNode)
        
        sun = (childNode(withName: "sun") as! SKSpriteNode)
        
        moveSun()
        
        
        originalTopY = meterTop.position.y
        originalMiddleHeight = meterMiddle.size.height
        originalMiddleYScale = meterMiddle.yScale
        
        updateScene()
        
      let url: URL = Bundle.main.url(forResource: "ES_Bubble Blip 2 - SFX Producer", withExtension: "mp3")!
      music = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)

      music.numberOfLoops = 1
      music.volume = 0.3
        
       
    }
    
    func setMeter(height: CGFloat) {
        meterTop.removeAllActions()
        meterMiddle.removeAllActions()
        
        let newHeight = max(minMeterHeight, min(maxMeterHeight, height))
        
        let moveTop = SKAction.moveTo(y: originalTopY - originalMiddleHeight + newHeight, duration: 1)
        moveTop.timingMode = .easeInEaseOut
        let resizeMiddle = SKAction.resize(toHeight: newHeight / originalMiddleYScale, duration: 1)
        resizeMiddle.timingMode = .easeInEaseOut
        
        meterTop.run(moveTop)
        meterMiddle.run(resizeMiddle)
    }
    
    func applyPanelRotation(up: Bool) {
        if up {
            solarPanelAngle = min(maxSolarPanelAngle, solarPanelAngle + 15)
        } else {
            solarPanelAngle = max(minSolarPanelAngle, solarPanelAngle - 15)
        }
        
        if solarPanelAngle == 45 {
            lightPointMove()
            PlaygroundPage.current.assessmentStatus = .pass(message: "Now we are ready to go to the [next page](@next)! ")
        }
    }
    
    func calculateMeterHeight() -> CGFloat {
        let angleP = (solarPanelAngle - minSolarPanelAngle) / (maxSolarPanelAngle - minSolarPanelAngle)
        let totalHeightInterval = (maxMeterHeight - minMeterHeight)
        return minMeterHeight + angleP * totalHeightInterval
        // angle p representa o quao proximo estamos do maxAngle. Consideramos que o max angle é o max de absorcao de energia enquanto o min angle é 0. AngleP é quanto porcento do quanto que estamos tirando do negocio
    }
    
    func lightPointMove() {
        
        let appears = SKAction.fadeAlpha(to: 1, duration: 2)
        SKAction.moveBy(x: 0 ,y: -245,duration: 1)
            let move1 = SKAction.move(to: CGPoint(x: 0,y: -345),duration: 1)
            move1.timingMode = .easeInEaseOut
            let move2 = SKAction.move(to: CGPoint(x: 300,y: -345),duration: 2)
            move2.timingMode = .easeInEaseOut
            let sequenceRepeat = SKAction.sequence([appears,move1, move2])
            lightPoint.run(sequenceRepeat)
    }
    
    func playMusic() {
        if music.isPlaying {
            music.stop()
        }
      
      music.play()
        
        
    }
    
    fileprivate func updateScene() {
        // rodar placa
        solarPanel.texture = SKTexture(imageNamed: "solarpanel\(solarPanelAngle)")
        // atualizar meter
        let newHeight = calculateMeterHeight()
        setMeter(height: newHeight)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        // FUNSSAO LEGAL setMeter(height: CGFloat.random(in: 1...130))
        if buttonUp.contains(pos) {
            // calcular nova posicao da placa
            applyPanelRotation(up: true)
            updateScene()
           
            buttonUp.texture = SKTexture(imageNamed: "buttonupdark")
            
        } else if buttonDown.contains(pos) {
            // calcular nova posicao da placa
            applyPanelRotation(up: false)
            updateScene()
            
            buttonDown.texture = SKTexture(imageNamed: "buttondowndark")
            
        }
    }
    
    
    func moveSun() {
    
        SKAction.moveBy(x: -170,y: 120,duration: 0.1)
            let move1 = SKAction.move(to: CGPoint(x: -170,y: 130),duration: 1)
            move1.timingMode = .easeInEaseOut
            let move2 = SKAction.move(to: CGPoint(x: -170,y: 120),duration: 1)
            move2.timingMode = .easeInEaseOut
            let move3 = SKAction.move(to: CGPoint(x: -170,y: 110),duration: 1)
            move3.timingMode = .easeInEaseOut
            let sequenceRepeat = SKAction.repeatForever(SKAction.sequence([move1, move2, move3]))
            sun.run(sequenceRepeat)
                
    }
    
    

    func touchMoved(toPoint pos : CGPoint) {
       
    }

    func touchUp(atPoint pos : CGPoint) {
        if buttonUp.contains(pos) {
                       
            buttonUp.texture = SKTexture(imageNamed: "buttonup")
            playMusic()
        } else if buttonDown.contains(pos) {
        
            buttonDown.texture = SKTexture(imageNamed: "buttondown")
            playMusic()
        }
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
     
}
