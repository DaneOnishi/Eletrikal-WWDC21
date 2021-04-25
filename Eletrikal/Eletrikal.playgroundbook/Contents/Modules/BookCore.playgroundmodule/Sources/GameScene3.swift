//
//  File.swift
//  PlaygroundBook
//
//  Created by Daniella Onishi on 11/04/21.
//

import Foundation
import SpriteKit
import AVFoundation
import CoreAudio
import PlaygroundSupport

public class GameScene3: SKScene {
    
    var background2: SKSpriteNode!
    
    var meterTop: SKSpriteNode!
    var meterMiddle: SKSpriteNode!
    var meterBottom: SKSpriteNode!
    
    var originalTopY: CGFloat!
    var originalMiddleHeight: CGFloat! // Dani do Futuro: definimos essa variavel aki pra kaso alteremo a gamescene.sks o código utilizar o novo valor, o mesmo se aplica pra linha 16!!
    var originalMiddleYScale: CGFloat!
    
    var buttonUp: SKSpriteNode!
    var buttonDown: SKSpriteNode!
    
    var eolicBase: SKSpriteNode!
    var eolicTop: SKSpriteNode!
    
    let minMeterHeight: CGFloat = 1
    let maxMeterHeight: CGFloat = 130
    var solarPanel: SKSpriteNode!
    
    var wind: SKSpriteNode!
    
    var recorder: AVAudioRecorder!
    let maxMicLevel: Float = -1.5
    var intensity: CGFloat = 0
    
    
    override public func didMove(to view: SKView) {
        
        background2 = (childNode(withName: "background-2") as! SKSpriteNode)
        meterTop = (childNode(withName: "meter_top") as! SKSpriteNode)
        meterMiddle = (childNode(withName: "meter_middle") as! SKSpriteNode)
        
        eolicBase = (childNode(withName: "eolic_base") as! SKSpriteNode)
        eolicTop = (childNode(withName: "eolic_top") as! SKSpriteNode)
        
        
        originalTopY = meterTop.position.y
        originalMiddleHeight = meterMiddle.size.height
        originalMiddleYScale = meterMiddle.yScale
      
        
        wind = (childNode(withName: "wind") as! SKSpriteNode)
        wind.alpha = 0.0
        
        let fadeInOut = SKAction.sequence([.moveBy(x: -200, y: 0, duration: 0),
                                           .fadeIn(withDuration: 0),
                                           .moveBy(x: 200, y: 0, duration: 2),
                                           .fadeOut(withDuration: 1.0)])
        wind.run(.repeatForever(fadeInOut))
        
        initMicrophone()
        updateScene()
        
    }
    
    func setMeter(height: CGFloat) {
        meterTop.removeAllActions()
        meterMiddle.removeAllActions()
        
        let newHeight = max(minMeterHeight, min(maxMeterHeight, height))
        
        let moveTop = SKAction.moveTo(y: originalTopY - originalMiddleHeight + newHeight, duration: 0)
        moveTop.timingMode = .easeInEaseOut
        let resizeMiddle = SKAction.resize(toHeight: newHeight / originalMiddleYScale, duration: 0)
        resizeMiddle.timingMode = .easeInEaseOut
        
        meterTop.run(moveTop)
        meterMiddle.run(resizeMiddle)
    }
    
    func calculateMeterHeight() -> CGFloat {
        //let angleP = CGFloat(0.5)
        let totalHeightInterval = (maxMeterHeight - minMeterHeight)
        return minMeterHeight + intensity * totalHeightInterval
    }
    
  
    
    fileprivate func updateScene() {
        let newHeight = calculateMeterHeight()
        setMeter(height: newHeight)
        
        if newHeight == 130{
            PlaygroundPage.current.assessmentStatus = .pass(message: "Yay! We have plenty of energy now, we will use it at [next page](@next)!")
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func initMicrophone() {
        let documents = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0])
        let url = documents.appendingPathComponent("record.caf")
        let recordSettings: [String: Any] = [
            AVFormatIDKey:              kAudioFormatAppleIMA4,
            AVSampleRateKey:            44100.0,
            AVNumberOfChannelsKey:      2,
            AVEncoderBitRateKey:        12800,
            AVLinearPCMBitDepthKey:     16,
            AVEncoderAudioQualityKey:   AVAudioQuality.max.rawValue
        ]
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            try recorder = AVAudioRecorder(url:url, settings: recordSettings)
            
        } catch {
            return
        }
        
        recorder.prepareToRecord()
        recorder.isMeteringEnabled = true
        recorder.record()
    }
    
    func updateMic() {
        recorder.updateMeters()
        let level = recorder.averagePower(forChannel: 0)
        
        if level <= -30 {
            return
        }
        
        let proportion = CGFloat(maxMicLevel / level)
        
        intensity = min(intensity + proportion * 0.037,1)
        
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
    
    public override func update(_ currentTime: TimeInterval) {
        eolicTop.zRotation = eolicTop.zRotation + (24 * .pi / 180) * intensity
        updateMic()
        updateScene()
        
        intensity = max(intensity - 0.0025, 0.01)
    }
}

