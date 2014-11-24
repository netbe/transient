//
//  MenuViewController.m
//  transient
//
//  Created by François Benaiteau on 24/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import "MenuViewController.h"

#import "StateViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)showState
{
    StateViewController* viewController = [[StateViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        [self showState];
    }
}

@end
