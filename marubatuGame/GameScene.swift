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
        
        backgroundColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        //背景色を変更
        
        let background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        //bg.pngを画面中央に表示
        addChild(background)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    
    //x座標とy座標をそれぞれ取得
    func transformX(w: CGFloat) -> CGFloat {
        switch w {
        case let w where self.size.width/2-150 < w && self.size.width/2-50 > w:
            return self.size.width/2-100
        case let w where self.size.width/2-50 < w && self.size.width/2+50 > w:
            return self.size.width/2-15
        case let w where self.size.width/2+50 < w && self.size.width/2+150 > w:
            return self.size.width/2+70
        default:
            return -100
        }
    }
    
    func transformY(w: CGFloat) -> CGFloat {
        switch w {
        case let w where self.size.height/2-150 < w && self.size.height/2-50 > w:
            return self.size.height/2+80
        case let w where self.size.height/2-50 < w && self.size.height/2+50 > w:
            return self.size.height/2
        case let w where self.size.height/2+50 < w && self.size.height/2+150 > w:
            return self.size.height/2-80
        default:
            return -100
        }
    }
    
    func mark(location: CGPoint) {
        let imageName = turn_o ? "o" : "x"
        let sign = SKSpriteNode(imageNamed: imageName)
        
        sign.position = CGPoint(x: transformX(location.x), y: transformY(location.y))
        
        addChild(sign)
        
        turn_o = !turn_o
    }
}