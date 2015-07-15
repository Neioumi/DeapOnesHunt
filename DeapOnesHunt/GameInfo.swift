//
//  GameInfo.swift
//  DeapOnesHunt
//
//  Created by biyo on 2015/07/15.
//  Copyright (c) 2015年 Naomi Hino. All rights reserved.
//

import SpriteKit

class InfoScene: SKScene {
    let infoLabel = SKLabelNode(fontNamed: "Verdana-bold")
    let menuLabel = SKLabelNode(fontNamed: "Verdana-bold")
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.grayColor()
        
        // Title
        infoLabel.text = "Info"
        infoLabel.fontSize = 70
        infoLabel.position = CGPoint(x: 375, y: 900)
        self.addChild(infoLabel)
        
        // Start Label
        menuLabel.text = "Back to Menu"
        menuLabel.fontSize = 60
        menuLabel.position = CGPoint(x: 375, y: 300)
        self.addChild(menuLabel)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let touchNode = self.nodeAtPoint(location)
            
            // Move to Game Scene
            if touchNode == menuLabel {
                let skView = self.view as SKView!
                let scene = TitleScene(size: self.size)
                scene.scaleMode = SKSceneScaleMode.AspectFill
                skView.presentScene(scene)
            }
        }
    }
    
}