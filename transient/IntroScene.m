//
//  IntroScene.m
//  transient
//
//  Created by François Benaiteau on 25/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import "IntroScene.h"

#import "ButtonNode.h"

@interface IntroScene ()
@property BOOL contentCreated;
@end

@implementation IntroScene

- (SKLabelNode *)titleNode
{
    if (!_titleNode) {
        _titleNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        _titleNode.text = @"Intro Scene";
        _titleNode.fontSize = 42;
        _titleNode.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    }
    return _titleNode;
}

- (void)didMoveToView:(SKView *) view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild:self.titleNode];
    ButtonNode* button1 = [ButtonNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(200, 30)];
    button1.name = @"button1";
    button1.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame)-60);
    button1.title = @"push me";
    [self addChild:button1];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    NSArray *nodes = [self nodesAtPoint:location];
    for (SKNode* node in nodes) {
        if ([node.name isEqualToString:@"button1"]) {
            if (self.button1TappedBlock) {
                self.button1TappedBlock();
            }
            return;
        }
    }
}
@end
