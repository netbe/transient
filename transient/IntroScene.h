//
//  IntroScene.h
//  transient
//
//  Created by François Benaiteau on 25/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
/**
 *  See https://developer.apple.com/library/ios/documentation/GraphicsAnimation/Conceptual/SpriteKit_PG/GettingStarted/GettingStarted.html
 */
@interface IntroScene : SKScene
@property(nonatomic, strong)SKLabelNode* titleNode;
@property(nonatomic, copy)void (^button1TappedBlock)();
@end
