//
//  Stage.swift
//  ActionSwiftSK
//
//  Created by Craig on 6/05/2015.
//  Copyright (c) 2015 Interactive Coconut. All rights reserved.
//

import SpriteKit
import UIKit

/**
Instantiate a Stage class passing in the skView.
*/
open class Stage: DisplayObjectContainer {
    fileprivate let skView: SKView
    static var size: CGSize = CGSize(width: 0, height: 0)

    public init(_ skView: SKView, using scene: SKScene? = nil) {
        self.skView = skView
        Stage.size = CGSize(width: self.skView.bounds.width, height: self.skView.bounds.height)
        super.init()
        if let scene {
            scene.size = Stage.size
            skView.presentScene(scene)
            scene.addChild(self.node)
        } else {
            let stageScene = StageScene(size: Stage.size)
            stageScene.stageSceneDelegate = self
            stageScene.scaleMode = SKSceneScaleMode.resizeFill
            stageScene.backgroundColor = UIColor.white
            skView.presentScene(stageScene)
            stageScene.addChild(self.node)
        }
        stage = self
    }

    class open func getSize() -> CGSize {
        Stage.size
    }

    class open var stageWidth: CGFloat {
        getSize().width
    }
    class open var stageHeight: CGFloat {
        getSize().height
    }
}
