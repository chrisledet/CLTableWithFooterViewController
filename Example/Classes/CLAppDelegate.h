//
//  CLAppDelegate.h
//  CLTableWithFooterViewController
//
//  Created by Chris Ledet on 7/5/13.
//  Copyright (c) 2013 Chris Ledet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CLViewController;

@interface CLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CLViewController *viewController;

@end
