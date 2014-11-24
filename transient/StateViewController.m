//
//  StateViewController.m
//  transient
//
//  Created by François Benaiteau on 24/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import "StateViewController.h"

static NSString *const kStateTextKey = @"transient.state.state-label.text";

@interface StateViewController ()<UIViewControllerRestoration>
@property(nonatomic, strong)UILabel* stateLabel;
@end

@implementation StateViewController

#pragma mark - UIViewControllerRestoration

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    StateViewController *viewController = [[self alloc] init];
    
    return viewController;
}

#pragma mark - UIStateRestoring

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super encodeRestorableStateWithCoder:coder];
    [coder encodeObject:self.stateLabel.text forKey:kStateTextKey];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super decodeRestorableStateWithCoder:coder];
    self.stateLabel.text = [coder decodeObjectForKey:kStateTextKey];
}

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.stateLabel = [[UILabel alloc] init];
    self.stateLabel.text = [NSDate date].description;
    [self.stateLabel sizeToFit];
    [self.view addSubview:self.stateLabel];
    self.stateLabel.center = self.view.center;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // instantiated in code, we need to specify both restorationIdentifier and restorationClass
        // and therefore implement UIViewControllerRestoration protocol
        self.restorationIdentifier = @"transient.state";
        self.restorationClass = [self class];
    }
    return self;
}

@end
