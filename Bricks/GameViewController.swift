//
//  GameViewController.swift
//  Bricks
//
//  Created by April on 12/5/14.
//  Copyright (c) 2014 TING. All rights reserved.
//

import UIKit
import SpriteKit

let ballCategory: uint   = 1; // 00000000000000000000000000000001
let brickCategory: uint  = 2; // 00000000000000000000000000000010
let paddleCategory: uint  = 4; // 00000000000000000000000000000100
let edgeCategory: uint   = 8; // 00000000000000000000000000001000
//let bottomEdgeCategory: uint = 16;

var score = 0
var scoreLabel = SKLabelNode()
var lives = 3


class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // StartScreen Loaded First, For iPhone5 screen size
        let scene = StartScreen(size:CGSize(width: 1152, height: 2048))
        scoreLabel.text =  "    Lives: \(lives)    Score: \(score)   "
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFit
        skView.presentScene(scene)
    }
    override func prefersStatusBarHidden() -> Bool  {
        return true
    }
}
