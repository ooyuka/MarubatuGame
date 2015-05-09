//
//  GameScene.swift
//  marubatuGame
//
//  Created by yukako oya on 2015/04/18.
//  Copyright (c) 2015年 yuka. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var turn_o = true
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 0)
        
        let background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(background)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func transform(w: CGFloat) -> CGFloat {
        switch w {
        case let w where 0 < w && w < 80:
            return 0
        case let w where 80 < w && w < 160:
            return 80
        case let w where 160 < w && w < 240:
            return 160
        default:
            return -80
        }
    }
    
    func mark(location: CGPoint) {
        let imageName = turn_o ? "o" : "x"
        let sign = SKSpriteNode(imageNamed: imageName)
        sign.position = CGPoint(x: transform(location.x), y: 160 - transform(location.y - 320))
        sign.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(sign)
        
        turn_o = !turn_o
    }
}