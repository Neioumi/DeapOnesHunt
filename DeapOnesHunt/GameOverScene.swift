//
//  GameOverScene.swift
//  DeapOnesHunt
//
//  Created by biyo on 2015/07/13.
//  Copyright (c) 2015年 Naomi Hino. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    let gameOverLabel = SKLabelNode(fontNamed: "Verdana")
    let replayLabel = SKLabelNode(fontNamed: "Verdana-bold")

    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.orangeColor()

        // Gameover Label
        gameOverLabel.text = "GAMEOVER!"
        gameOverLabel.fontSize = 100
        gameOverLabel.fontColor = UIColor.blackColor()
        gameOverLabel.position = CGPoint(x: 375, y: 1100)
        self.addChild(gameOverLabel)

        // Replay Label
        replayLabel.text = "Replay"
        replayLabel.fontSize = 60
        replayLabel.fontColor = UIColor.redColor()
        replayLabel.position = CGPoint(x: 375, y: 300)
        self.addChild(replayLabel)
        
        // Score
        let scoreLabel = SKLabelNode(fontNamed: "Verdana")
        let gameSKView = self.view as! GameSKView
        scoreLabel.text = "SCORE:\(gameSKView.score)"
        scoreLabel.fontSize = 80
        scoreLabel.position = CGPoint(x: 375, y: 800)
        self.addChild(scoreLabel)
        
        // High Score
        let highScoreLabel = SKLabelNode(fontNamed: "Verdana")
        highScoreLabel.text = "HIGH SCORE:\(gameSKView.highScore)"
        highScoreLabel.fontSize = 40
        highScoreLabel.position = CGPoint(x: 375, y: 700)
        self.addChild(highScoreLabel)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let touchNode = self.nodeAtPoint(location)
            
            // Back to Title Scene
            if touchNode == replayLabel {
                let scene = TitleScene(size: self.size)
                let skView = self.view as SKView!
                scene.scaleMode = SKSceneScaleMode.AspectFill
                skView.presentScene(scene)
            }
        }
    }
}