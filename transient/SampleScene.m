//
//  SampleScene.m
//  transient
//
//  Created by François Benaiteau on 25/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import "SampleScene.h"

@implementation SampleScene


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
    self.backgroundColor = [SKColor yellowColor];
}

@end
