//
//  AppDelegate.m
//  UITabBarController_HomeWork
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"


@interface AppDelegate ()

@property (nonatomic, retain)UITabBarController *ta;

@end

@implementation AppDelegate

- (void)dealloc{
    [_window release];
    [super dealloc];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    [_window release];
    
    [self createTabBarController];
    
    
    return YES;
}


- (void)createTabBarController{

    self.ta = [[UITabBarController alloc] init];
    [self createViewController];
    
    self.ta.tabBar.tintColor = [UIColor darkGrayColor];
    self.ta.tabBar.barTintColor =[UIColor whiteColor];
    
    
    
    self.window.rootViewController = _ta;
    [_ta release];

}



- (void)createViewController{

    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *first = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.navigationItem.title = @"第一页";
    first.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"消息" image:[UIImage imageNamed:@"i"] tag:100];
    
    
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    UINavigationController *second = [[UINavigationController alloc] initWithRootViewController:secondVC];
    
    secondVC.edgesForExtendedLayout = UIRectEdgeNone;
    
    secondVC.navigationItem.title = @"第二页";
    second.tabBarItem =[[UITabBarItem alloc] initWithTitle:@"看图" image:[UIImage imageNamed:@"t"] tag:200];
    
    
    
    ThirdViewController *thirdVc = [[ThirdViewController alloc] init];
    UINavigationController *third = [[UINavigationController alloc] initWithRootViewController:thirdVc];
    thirdVc.navigationItem.title = @"第三页";
    third.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"空间" image:[UIImage imageNamed:@"k"] tag:300];
    
    
    
    self.ta.viewControllers = @[first, second, third];

    [vc release];
    [first release];
    [secondVC release];
    [second release];
    [thirdVc release];
    [third release];
}












- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
