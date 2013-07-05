//
//  CLAppDelegate.m
//  CLTableWithFooterViewController
//
//  Created by Chris Ledet on 7/5/13.
//  Copyright (c) 2013 Chris Ledet. All rights reserved.
//

#import "CLAppDelegate.h"

#import "CLViewController.h"

@implementation CLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    self.viewController = [[CLViewController alloc] init];
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
