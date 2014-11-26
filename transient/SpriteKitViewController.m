//
//  SpriteKitViewController.m
//  transient
//
//  Created by François Benaiteau on 24/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import "SpriteKitViewController.h"

#import "IntroScene.h"
#import "SampleScene.h"

@import SpriteKit;

@interface SpriteKitViewController ()
@property(nonatomic,strong)SKView* spriteKitView;
@end

@implementation SpriteKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.spriteKitView = [[SKView alloc] initWithFrame:self.view.frame];
    self.spriteKitView.backgroundColor = [UIColor yellowColor];
    self.spriteKitView.showsFPS = YES;
    self.spriteKitView.showsNodeCount = YES;
    [self.view addSubview:self.spriteKitView];
    
    [self showEmptyScene];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showIntroScene];
    });
}

- (void)showEmptyScene
{
    // without a scene, can't see anything on the spriteKitView
    SKScene* scene = [[SKScene alloc] initWithSize:self.spriteKitView.bounds.size];
    [self.spriteKitView presentScene:scene];
}

- (void)showIntroScene
{
    IntroScene* scene = [[IntroScene alloc] initWithSize:self.spriteKitView.bounds.size];
    __weak __typeof(&*self)weakSelf = self;
    scene.button1TappedBlock = ^{
        [weakSelf showSampleScene];
    };
    [self.spriteKitView presentScene:scene];
}

- (void)showSampleScene
{
    SampleScene* scene = [[SampleScene alloc] initWithSize:self.spriteKitView.bounds.size];
    SKTransition* transition = [SKTransition pushWithDirection:SKTransitionDirectionLeft duration:0.5];
    [self.spriteKitView presentScene:scene transition:transition];
}

@end
