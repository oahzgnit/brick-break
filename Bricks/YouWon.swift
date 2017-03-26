//
//  YouWon.swift
//  Bricks
//
//  Created by April on 12/5/14.
//  Copyright (c) 2014 TING. All rights reserved.
//

import SpriteKit

class YouWon: SKScene,SKPhysicsContactDelegate  {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        //  Setup Background and World
        let bgImage = SKSpriteNode(imageNamed: "start")
        self.addChild(bgImage)
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2)
        //self.backgroundColor = UIColor.blackColor()
        
        // Setup Label
        let label = SKLabelNode(text: "You Won!")
        label.fontSize = 200
        label.fontColor = UIColor.yellowColor()
        label.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        self.addChild(label)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let myTransition = SKTransition.doorsOpenHorizontalWithDuration(2)
        let scene = GameScene(size:CGSize(width: 1152, height: 2048))
        self.view?.presentScene(scene, transition: myTransition)
        
        
        
    }
    
}
