//
//  LabelNode.swift
//  ActionSwift
//
//  Created by Craig Grummitt on 23/10/2015.
//  Copyright © 2015 Interactive Coconut. All rights reserved.
//

import SpriteKit

class LabelNode: SKLabelNode {
    weak var owner: DisplayObject?
    //Interactive
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dispatchTouches(.TouchBegin, touches: touches)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dispatchTouches(.TouchEnd, touches: touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        dispatchTouches(.TouchMove, touches: touches)
    }

    func dispatchTouches(_ touchType: InteractiveEventType, touches: Set<UITouch>) {
        if let owner = owner as? InteractiveObject {
            var touchesToDispatch: [Touch] = []
            for touch in touches {
                if let parent = parent {
                    let loc = touch.location(in: parent)
                    let stageLoc = touch.location(in: self.scene?.view)
                    touchesToDispatch.push(Touch(localX: loc.x,
                                                 localY: loc.y,
                                                 stageX: stageLoc.x,
                                                 stageY: stageLoc.y,
                                                 sizeX: touch.majorRadius,
                                                 sizeY: touch.majorRadius))
                }
            }
            print("Touched label")
            owner.dispatchEvent(TouchEvent(touchType, touchesToDispatch))
        }
    }
}
