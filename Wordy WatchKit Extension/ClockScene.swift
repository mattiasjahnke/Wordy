//
//  ClockScene.swift
//  Wordy WatchKit Extension
//
//  Created by Mattias Jähnke on 2018-08-16.
//  Copyright © 2018 Engineerish. All rights reserved.
//

import Foundation
import SpriteKit

class ClockScene: SKScene {
    
    let clock = EnglishWordClock()
    
    override func sceneDidLoad() {
        let fontSize: CGFloat = 14
        let yDiff: CGFloat = 16
        let fullSize = CGFloat(clock.height) * yDiff
        backgroundColor = .black
        
        let eachWidth = (size.width - 3) / CGFloat(clock.width)
        for y in 0..<clock.height {
            for x in 0..<clock.width {
                let node = SKLabelNode(text: "X")
                node.fontName = "AvenirNext-Bold"
                node.fontSize = fontSize
                node.name = "\(y)\(x)"
                let yOffset = (size.height / 2 + fullSize / 2)
                node.position = CGPoint(x: 7 + CGFloat(x) * eachWidth,
                                        y: yOffset - CGFloat(y) * yDiff)
                addChild(node)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        let result = clock.getResult(time: Date())
        for y in 0..<clock.height {
            for x in 0..<clock.width {
                let node = childNode(withName: "\(y)\(x)") as! SKLabelNode
                node.text = String(result[y][x].0)
                node.alpha = result[y][x].1 ? 1 : 0.2
            }
        }
    }
}
