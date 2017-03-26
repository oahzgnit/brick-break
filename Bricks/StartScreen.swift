//
//  StartScreen.swift
//  Bricks
//
//  Created by April on 12/5/14.
//  Copyright (c) 2014 TING. All rights reserved.
//

import Foundation
import SpriteKit

class StartScreen: SKScene,SKPhysicsContactDelegate  {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        //var skyColor = SKColor()
        
        //  Setup Background and World
        let bgImage = SKSpriteNode(imageNamed: "start.png")
        self.addChild(bgImage)
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2)
        //self.backgroundColor = UIColor(patternImage: UIImage(named: "start.png")!)
        //self.backgroundColor = UIColor.blueColor()
        //skyColor = SKColor(red: 81.0/255.0, green: 192.0/255.0, blue: 201.0/255.0, alpha: 1.0)
        //self.backgroundColor = skyColor

        
        // Setup Label
        var label = SKLabelNode(text: "Start Game ?")
        label.fontSize = 180
        label.fontColor = SKColor.whiteColor()
        label.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        self.addChild(label)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        var myTransition = SKTransition.doorsOpenHorizontalWithDuration(0.5)
        let scene = GameScene(size:CGSize(width: 1152, height: 2048))
        self.view?.presentScene(scene, transition: myTransition)
        
        
        
    }
    
}
