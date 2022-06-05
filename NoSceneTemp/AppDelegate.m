//
//  AppDelegate.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/5.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UITabBarController *tabVC = UITabBarController.new;
    _window = UIWindow.new;
    _window.rootViewController = tabVC;
    UIViewController *firstVC = UIViewController.new;
    UINavigationController *secondVC = UINavigationController.new;
    tabVC.viewControllers = @[firstVC, secondVC];
    firstVC.tabBarItem.title = @"Videos";
    firstVC.tabBarItem.image = [UIImage systemImageNamed:@"play.circle.fill"];
    
    secondVC.tabBarItem.title = @"User";
    secondVC.tabBarItem.image = [UIImage systemImageNamed:@"person.circle"];
    secondVC.navigationBarHidden = YES;
    [_window makeKeyAndVisible];
    
    return YES;
}

@end