//
//  TitleScene.swift
//  DeapOnesHunt
//
//  Created by biyo on 2015/07/13.
//  Copyright (c) 2015年 Naomi Hino. All rights reserved.
//

import SpriteKit

class TitleScene: SKScene {
    let titleLabel = SKLabelNode(fontNamed: "Verdana-bold")
    let infoLabel = SKLabelNode(fontNamed: "Verdana-bold")
    let startLabel = SKLabelNode(fontNamed: "Verdana-bold")
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.brownColor()
        
        // Title
        titleLabel.text = "Deap Ones Hunt"
        titleLabel.fontSize = 70
        titleLabel.position = CGPoint(x: 375, y: 900)
        self.addChild(titleLabel)
        
        // Info Label
        infoLabel.text = "Info"
        infoLabel.fontSize = 40
        infoLabel.horizontalAlignmentMode = .Right
        infoLabel.position = CGPoint(x: 600, y: 1200)
        self.addChild(infoLabel)
        
        // Start Label
        startLabel.text = "Start"
        startLabel.fontSize = 60
        startLabel.position = CGPoint(x: 375, y: 300)
        self.addChild(startLabel)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let touchNode = self.nodeAtPoint(location)
            
            // Move to Info Scene
            if touchNode == infoLabel {
                let skView = self.view as SKView!
                let scene = InfoScene(size: self.size)
                scene.scaleMode = SKSceneScaleMode.AspectFill
                skView.presentScene(scene)
            }
            
            // Move to Game Scene
            if touchNode == startLabel {
                let skView = self.view as SKView!
                let scene = GameScene(size: self.size)
                scene.scaleMode = SKSceneScaleMode.AspectFill
                skView.presentScene(scene)
            }
        }
    }
    
}
