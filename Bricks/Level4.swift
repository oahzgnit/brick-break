//
//  Level4.swift
//  Bricks
//
//  Created by April on 12/11/14.
//  Copyright (c) 2014 TING. All rights reserved.
//

import SpriteKit




class Level4: SKScene,SKPhysicsContactDelegate  {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        //  Setup Background and World
        var bgImage = SKSpriteNode(imageNamed: "bg04")
        self.addChild(bgImage)
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2)
        //self.backgroundColor = UIColor.blackColor()
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsWorld.contactDelegate = self
        
        // Setup Label
        //        score = 0
        scoreLabel.position =  CGPoint(x: self.frame.width/2, y: self.frame.height-150)
        scoreLabel.fontSize = 100
        scoreLabel.fontColor = SKColor.yellowColor()
        self.addChild(scoreLabel)
        
        // Create Elements, Put Ball into motion
        createBottomEdge()
        createBricksOneRow()
        createBricksSecondRow()  // Level Becomes More Advanced
        createBricksThirdRow()
        createBall()
        activeBall()
        createPaddle()
        
        
        
        
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            var newPosition = CGPointMake(location.x, 100);
            
            self.childNodeWithName("paddle")?.position.x = location.x
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        //Update Label
        scoreLabel.text = "    Lives: \(lives)    Score: \(score)   "
        
        if score == 35 {    // Level is complete
            self.removeAllChildren()
            var myTransition = SKTransition.doorsOpenVerticalWithDuration(2)
            let scene = Level5(size:CGSize(width: 1152, height: 2048))
            score = 35
            self.view?.presentScene(scene)
        }
        
        if lives <= 0 {   // Player lost all lives. End Game
            self.removeAllChildren()
            var myTransition = SKTransition.doorsOpenVerticalWithDuration(2)
            let scene = EndScreen4(size:CGSize(width: 1152, height: 2048))
            self.view?.presentScene(scene)
            lives = 3
            
        }
        
        
    }
    
    func createBricksThirdRow(){
        
        for counter in 1...1{
            let brick = SKSpriteNode(imageNamed:"brick")
            brick.setScale(4)
            
            let fifthOfScreenWidth:CGFloat = size.width
            var cgFloatCounter = CGFloat(counter)
            
            let xPos: CGFloat =   fifthOfScreenWidth * cgFloatCounter
            let yPos = size.height * 0.65
            brick.position = CGPoint(x: xPos, y: yPos)
            
            brick.name = "brick"
            brick.physicsBody = SKPhysicsBody(rectangleOfSize: brick.size)
            brick.physicsBody?.dynamic = false
            brick.physicsBody?.affectedByGravity = false
            brick.physicsBody?.categoryBitMask = paddleCategory
            
            let MoveAction = SKAction.moveByX(CGFloat(-size.width), y: 0, duration: 5)
            let ResetAction = SKAction.moveByX(CGFloat(size.width), y: 0, duration: 5)
            let MoveActionForever = SKAction.repeatActionForever(SKAction.sequence([MoveAction,ResetAction]))
            //brick.runAction(SKAction.repeatActionForever(action))
            brick.runAction(MoveActionForever)
            self.addChild(brick)
            
        }
        
    }
    
    func createBricksOneRow(){
        
        for counter in 1...5{
            let brick = SKSpriteNode(imageNamed:"brick01")
            brick.setScale(4)
            
            let fifthOfScreenWidth:CGFloat = size.width/6
            var cgFloatCounter = CGFloat(counter)
            
            let xPos: CGFloat =   fifthOfScreenWidth * cgFloatCounter
            let yPos = size.height * 0.75
            brick.position = CGPoint(x: xPos, y: yPos)
            
            brick.name = "brick01"
            brick.physicsBody = SKPhysicsBody(rectangleOfSize: brick.size)
            brick.physicsBody?.dynamic = false
            brick.physicsBody?.affectedByGravity = false
            brick.physicsBody?.categoryBitMask = brickCategory
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI/4), duration:1)
            brick.runAction(SKAction.repeatActionForever(action))
            self.addChild(brick)
            
        }
        
    }
    
    func createBricksSecondRow(){
        
        for counter in 1...5{
            let brick = SKSpriteNode(imageNamed:"brick02")
            brick.setScale(3)
            
            let fifthOfScreenWidth:CGFloat = size.width/6
            var cgFloatCounter = CGFloat(counter)
            let xPos: CGFloat =   fifthOfScreenWidth * cgFloatCounter
            let yPos = size.height * 0.85
            brick.position = CGPoint(x: xPos, y: yPos)
            
            brick.name = "brick02"
            
            brick.physicsBody = SKPhysicsBody(rectangleOfSize: brick.size)
            brick.physicsBody?.dynamic = false
            brick.physicsBody?.affectedByGravity = false
            brick.physicsBody?.categoryBitMask = brickCategory
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:2)
            
            brick.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(brick)
            
        }
        
    }
    
    
    func createPaddle(){
        let paddle = SKSpriteNode(imageNamed: "paddle")
        paddle.position.x = self.frame.width/2
        paddle.position.y = 220
        paddle.setScale(5)
        paddle.name = "paddle"
        paddle.physicsBody = SKPhysicsBody(rectangleOfSize: paddle.size)
        paddle.physicsBody?.dynamic = false
        paddle.physicsBody?.affectedByGravity = false
        paddle.physicsBody?.categoryBitMask = paddleCategory
        //   paddle.physicsBody?.contactTestBitMask = ballCategory
        
        
        self.addChild(paddle)
    }
    
    func createBall(){
        
        let ball = SKSpriteNode(imageNamed: "ball")
        ball.position.x = self.frame.width/2
        ball.position.y = 350
        ball.setScale(5)
        ball.name = "ball"
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.dynamic = true
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.restitution = 1.06
        ball.physicsBody?.friction = 0.0
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.categoryBitMask = ballCategory
        ball.physicsBody?.contactTestBitMask = brickCategory | edgeCategory
        self.addChild(ball)
        
        //add emitter
        let sparkEmmiter = SKEmitterNode(fileNamed: "MyParticle.sks")
        sparkEmmiter!.name = "sparkEmmitter"
        sparkEmmiter!.zPosition = 1
        sparkEmmiter!.targetNode = self
        sparkEmmiter!.particleLifetime = 1
        
        ball.addChild(sparkEmmiter!)
        
    }
    
    func activeBall(){
        
        let myVector = CGVector(dx: 3, dy: 150)
        let sprite = self.childNodeWithName("ball")
        sprite?.physicsBody?.applyImpulse(myVector)
    }
    
    func createBottomEdge(){
        let bottomEdgeShape = SKSpriteNode(color: UIColor.darkGrayColor(), size: CGSize(width: self.frame.width, height: 20))
        bottomEdgeShape.name = "bottomEdgeShape"
        bottomEdgeShape.position.x = self.frame.midX
        bottomEdgeShape.position.y  = 20
        bottomEdgeShape.physicsBody = SKPhysicsBody(rectangleOfSize: bottomEdgeShape.size)
        bottomEdgeShape.physicsBody?.dynamic = false
        bottomEdgeShape.physicsBody?.affectedByGravity = false
        
        bottomEdgeShape.physicsBody?.categoryBitMask = edgeCategory
        bottomEdgeShape.physicsBody?.contactTestBitMask = ballCategory
        
        self.addChild(bottomEdgeShape)
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        
        if contact.bodyA.categoryBitMask == brickCategory
        {
            self.runAction(SKAction .playSoundFileNamed("Tink.aiff", waitForCompletion: true))
            contact.bodyA.node?.removeFromParent()
            score += 1
        }
        
        if contact.bodyB.categoryBitMask == brickCategory
        {
            self.runAction(SKAction .playSoundFileNamed("Tink.aiff", waitForCompletion: true))
            contact.bodyB.node?.removeFromParent()
            score += 1
        }
        
        
        if contact.bodyA.categoryBitMask == edgeCategory
        {  //ball hit bottom edge
            lives -= 1
            self.runAction(SKAction .playSoundFileNamed("brickhit.caf", waitForCompletion: true))
            
            
        }
        
        if contact.bodyB.categoryBitMask == edgeCategory
        {   //ball hit bottom edge
            self.runAction(SKAction .playSoundFileNamed("brickhit.caf", waitForCompletion: true))
            
            lives -= 1
        }
        
        
        
        
    }
    
    
}