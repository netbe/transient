//
//  InterfaceBuilderViewController.m
//  transient
//
//  Created by François Benaiteau on 18/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import "InterfaceBuilderViewController.h"

#import "CustomView.h"

@interface InterfaceBuilderViewController ()
@property(nonatomic, strong)CustomView* view;
@end

@implementation InterfaceBuilderViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"InterfaceBuilderViewController did load");
    [self.view setText:@"viewDidLoad"];
}

@end
