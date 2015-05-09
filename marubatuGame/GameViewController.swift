//
//  GameViewController.swift
//  marubatuGame
//
//  Created by yukako oya on 2015/04/18.
//  Copyright (c) 2015年 yuka. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        let location = sender.locationInView(view)
        println("tapped at \(location.x), \(location.y)")
        scene.mark(location)
    }
    
}