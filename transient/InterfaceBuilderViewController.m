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

- (NSString *)note
{
    NSString* className = NSStringFromClass(self.class);
    NSURL* fileURL = [[NSBundle mainBundle] URLForResource:className withExtension:@"md"];
    return [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:NULL];
}


- (IBAction)showNote:(id)sender
{
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:nil message:[self note] preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* closeAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:closeAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)viewDidLoad 
{
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"InterfaceBuilderViewController did load");
//    [self.view setText:@"viewDidLoad"];
}

@end
