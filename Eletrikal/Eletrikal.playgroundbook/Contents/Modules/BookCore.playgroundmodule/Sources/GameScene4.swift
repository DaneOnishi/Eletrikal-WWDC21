//
//  GameScene3.swift
//  BookCore
//
//  Created by Daniella Onishi on 11/04/21.
//

// criar os cards e adicionar drag
// quando drag -> abajur -> luz
// luz incandescente
// luz fluorescente
// luz led

import SpriteKit
import PlaygroundSupport
import AVFoundation

public class GameScene4: SKScene {
    
    var background: SKSpriteNode!
    var dragging: SKSpriteNode?
    var originalDraggingPos: CGPoint?
    var incandescentLamp: SKSpriteNode!
    var fluorescentLamp: SKSpriteNode!
    var ledLamp: SKSpriteNode!
    var fluorescentLight: SKLightNode!
    var incandescentLight: SKLightNode!
    var ledLight: SKLightNode!
    var zTop: CGFloat = 1
    var listaImagem: [SKSpriteNode]!
    var candleHitBox: SKShapeNode!
    var popUp: SKSpriteNode!
    var music: AVAudioPlayer!

    override public func didMove(to view: SKView) {
        
        incandescentLamp = (childNode(withName: "incandescent_lamp") as! SKSpriteNode)
        fluorescentLamp = (childNode(withName: "fluorescent_lamp") as! SKSpriteNode)
        ledLamp = (childNode(withName: "led_lamp") as! SKSpriteNode)
        listaImagem = [incandescentLamp, fluorescentLamp, ledLamp]
                                
        fluorescentLight = (childNode(withName: "fluorescent_light") as! SKLightNode)
        incandescentLight = (childNode(withName: "incandescent_light") as! SKLightNode)
        ledLight = (childNode(withName: "led_light") as! SKLightNode)
        
        popUp = (childNode(withName: "popUp") as! SKSpriteNode)
               
        
        candleHitBox = (childNode(withName: "candle_hitbox") as! SKShapeNode)
        
    }
    
    func playMusic() {
        let url: URL = Bundle.main.url(forResource: "ES_Bubble Blip 2 - SFX Producer", withExtension: "mp3")!
        music = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)

      music.numberOfLoops = 1
      music.prepareToPlay()
      music.volume = 0.3
      music.play()
    }
   /* public func setIlumination(incandescent: Bool, fluorescent: Bool, led: Bool) {
        var illuminateIncandescent = incandescentLamp.position(x: 500, y: 500)
        
        if illuminateIncandescent {
            incandescentLight.alpha = 1
        } else {
            incandescentLight.alpha = 0
        }
    
        
    }
    */
    func touchDown(atPoint pos : CGPoint) {
        for imagem in listaImagem {
            if imagem.contains(pos) {
                dragging = imagem
                originalDraggingPos = imagem.position
                imagem.setScale(1.15)
                imagem.zPosition = zTop
                zTop += 1
                return
            }
        }
    }

    func touchUp(atPoint pos : CGPoint) {
        dragging?.setScale(1)
        if let originalDraggingPos = originalDraggingPos {
            dragging?.position = originalDraggingPos
        }
        if candleHitBox.contains(pos) {
            if dragging?.name == incandescentLamp.name {
                incandescentLight.isEnabled = true
                fluorescentLight.isEnabled = false
                ledLight.isEnabled = false
                //mudar icone da incandescente para aceso
                incandescentLamp.run(.setTexture(SKTexture(imageNamed: "incandescent_with_light"), resize: true))
                fluorescentLamp.run(.setTexture(SKTexture(imageNamed: "fluorescent_lamp"), resize: true))
                ledLamp.run(.setTexture(SKTexture(imageNamed: "led_lamp"), resize: true))
                 popUp.texture = SKTexture(imageNamed: "incadescent_popup")
                playMusic()
            
            } else if dragging?.name == fluorescentLamp.name {
                incandescentLight.isEnabled = false
                fluorescentLight.isEnabled = true
                ledLight.isEnabled = false
                //mudar icone da fluorescente para aceso
                incandescentLamp.run(.setTexture(SKTexture(imageNamed: "incandescent_lamp"), resize: true))
                fluorescentLamp.run(.setTexture(SKTexture(imageNamed: "fluorescent_with_light"), resize: true))
                ledLamp.run(.setTexture(SKTexture(imageNamed: "led_lamp"), resize: true))
                 popUp.texture = SKTexture(imageNamed: "fluorescent_popup")
                playMusic()

            } else if dragging?.name == ledLamp.name {
                incandescentLight.isEnabled = false
                fluorescentLight.isEnabled = false
                ledLight.isEnabled = true
                //mudar icone da led para aceso
                
                incandescentLamp.run(.setTexture(SKTexture(imageNamed: "incandescent_lamp"), resize: true))
                fluorescentLamp.run(.setTexture(SKTexture(imageNamed: "fluorescent_lamp"), resize: true))
                ledLamp.run(.setTexture(SKTexture(imageNamed: "led_with_light"), resize: true))
                 popUp.texture = SKTexture(imageNamed: "ledlamp_popup")
                
                
                PlaygroundPage.current.assessmentStatus = .pass(message: "Led lamps are the best option not to waste our energy, but how can we make it's use even better? Discover at [next page](@next)!")
                playMusic()
            }
        }
        dragging = nil
    }
    
    func touchMoved(atPoint pos : CGPoint) {
        dragging?.position = pos
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(atPoint: t.location(in: self)) }
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
}
