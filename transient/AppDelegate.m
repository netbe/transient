//
//  AppDelegate.m
//  transient
//
//  Created by François Benaiteau on 18/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self applicationFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self applicationFinishLaunchingWithOptions:launchOptions];
    return YES;
}

// Add restorationId to all UI elements to be saved. i.e: UIViewController, UINavigationController, ...
- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    // see https://github.com/kharrison/CodeExamples/blob/master/Restorer/Restorer/UYLAppDelegate.m
    
    // can check if current bundle version is different from saved applicationState
    // Retrieve the Bundle Version Key so we can check if the restoration data is from an older
    // version of the App that would not make sense to restore. This might be the case after we
    // have made significant changes to the view hierarchy.
    NSDictionary *infoDictionary = [[NSBundle mainBundle]infoDictionary];
    NSString *buildVersion = infoDictionary[(NSString*)kCFBundleVersionKey];
    
    NSString *restorationBundleVersion = [coder decodeObjectForKey:UIApplicationStateRestorationBundleVersionKey];
    if ([restorationBundleVersion integerValue] < [buildVersion integerValue])
    {
        NSLog(@"Ignoring restoration data for bundle version: %@",restorationBundleVersion);
        return NO;
    }
    
    // Retrieve the User Interface Idiom (iPhone or iPad) for the device that created the restoration Data.
    // This allows us to ignore the restoration data when the user interface idiom that created the data
    // does not match the current device user interface idiom.
    
    UIDevice *currentDevice = [UIDevice currentDevice];
    UIUserInterfaceIdiom restorationInterfaceIdiom = [[coder decodeObjectForKey:UIApplicationStateRestorationUserInterfaceIdiomKey] integerValue];
    UIUserInterfaceIdiom currentInterfaceIdiom = currentDevice.userInterfaceIdiom;
    if (restorationInterfaceIdiom != currentInterfaceIdiom)
    {
        NSLog(@"Ignoring restoration data for interface idiom: %d",restorationInterfaceIdiom);
        return NO;
    }
    
    return YES;
}

#pragma mark - Private

- (void)applicationFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // common code heres
    });
}


@end
