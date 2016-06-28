//
//  AppDelegate.m
//  XYLinkageTableViewController
//
//  Created by 罗显勇 on 16/6/27.
//  Copyright © 2016年 JetLuo. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[DemoViewController alloc] init]];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
