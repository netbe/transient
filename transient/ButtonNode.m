//
//  ButtonNode.m
//  transient
//
//  Created by François Benaiteau on 25/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import "ButtonNode.h"
@interface ButtonNode ()
@property(nonatomic,strong)SKLabelNode* labelNode;
@end

@implementation ButtonNode

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    self.labelNode.text = title;
}

- (instancetype)initWithTexture:(SKTexture *)texture color:(UIColor *)color size:(CGSize)size
{
    self = [super initWithTexture:texture color:color size:size];
    if (self) {
        SKLabelNode* button1Node = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        button1Node.userInteractionEnabled = NO;
        if (!self.title) {
            button1Node.text = @"button1";
        }else{
            button1Node.text = self.title;
        }
        button1Node.fontColor = [SKColor blackColor];
        button1Node.fontSize = 21;
        button1Node.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        [self addChild:button1Node];
        self.labelNode = button1Node;
    }
    return self;
}
@end
