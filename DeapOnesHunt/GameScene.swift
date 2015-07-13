//
//  GameScene.swift
//  DeapOnesHunt
//
//  Created by biyo on 2015/07/13.
//  Copyright (c) 2015年 Naomi Hino. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // Dummy Enemy
    let deapOnePoint = [[200, 800], [300, 900], [400, 800], [500, 900], [600, 800]]
    var deapOneArray:[SKSpriteNode] = []
    
    // Score
    var score = 0
    let scoreLabel = SKLabelNode(fontNamed: "Verdana")
    
    // Dummy GameOver Label
    let dummyGameOverLabel = SKLabelNode(fontNamed: "Verdana-bold")

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.backgroundColor = SKColor.whiteColor()

        for i in 0...4 {
            // Dummy Enemy
            let deapOne = SKSpriteNode(imageNamed: "dummyEnemmy.png")
            deapOne.position = CGPoint(x:deapOnePoint[i][0], y:deapOnePoint[i][1])
            self.addChild(deapOne)
            
            deapOneArray.append(deapOne)

            // Dummy Enemie's Actions
            let action1 = SKAction.moveToY(-1000, duration: 0.0)
            let action2 = SKAction.waitForDuration(2.0, withRange: 4.0)
            let action3 = SKAction.moveToY(deapOne.position.y, duration: 0.0)
            let action4 = SKAction.waitForDuration(1.0, withRange: 2.0)
            let actionS = SKAction.sequence([action1, action2, action3, action4])
            let actionR = SKAction.repeatActionForever(actionS)
            
            deapOne.runAction(actionR)
        }

        // Score
        scoreLabel.text = "SCORE:\(score)"
        scoreLabel.fontSize = 50
        scoreLabel.horizontalAlignmentMode = .Left
        scoreLabel.fontColor = SKColor.blackColor()
        scoreLabel.position = CGPoint(x: 40, y: 1250)
        self.addChild(scoreLabel)
        
        // Go to Game Over Scene (Dummy button for dev)
        dummyGameOverLabel.text = "Move to Game Over"
        dummyGameOverLabel.fontSize = 60
        dummyGameOverLabel.fontColor = SKColor.redColor()
        dummyGameOverLabel.position = CGPoint(x: 375, y: 300)
        self.addChild(dummyGameOverLabel)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let touchNode = self.nodeAtPoint(location)
            
            for i in 0...4 {
                // Earn Points for Kill Enemy
                if touchNode == deapOneArray[i] {
                    score += 10
                    scoreLabel.text = "SCORE:\(score)"
                    
                    // Change Enemy Image
                    let deapOne = SKSpriteNode(imageNamed: "dummyEnemmy.png")
                    deapOne.position = touchNode.position
                    self.addChild(deapOne)
                
                    // Delete Killed Enemy from Parent
                    let action1 = SKAction.rotateByAngle(6.28, duration: 0.3)
                    let action2 = SKAction.moveToY(touchNode.position.y + 150, duration: 0.3)
                    let actionG = SKAction.group([action1, action2])
                    let action3 = SKAction.removeFromParent()
                    let actionS = SKAction.sequence([actionG, action3])
                    deapOne.runAction(actionS)
                    
                    touchNode.position.y = -1000
                }
            }
            
            // Move to Game Over Scene (Dummy Button for Develop)
            if touchNode == dummyGameOverLabel {
                
                // Send Score to GameSKView
                let skView = self.view as! GameSKView
                skView.score = score
                
                if skView.highScore < skView.score {
                    skView.highScore = score
                }
                
                let scene = GameOverScene(size: self.size)
                scene.scaleMode = SKSceneScaleMode.AspectFill
                skView.presentScene(scene)
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
