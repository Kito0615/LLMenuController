//
//  AppDelegate.m
//  LLMenuController
//
//  Created by AnarL on 16/3/1.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#define COLOR_WITH_RGB_VALUE(RGB_VALUE)     [UIColor colorWithRed:RGB_VALUE.red / 255.0 green:RGB_VALUE.green / 255.0 blue:RGB_VALUE.blue / 255.0  alpha:1]


#import "AppDelegate.h"
#import "NSString+HexToRGB.h"

@interface AppDelegate ()
{
    ViewController * VC;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    NSMutableArray * controllers = [[NSMutableArray alloc] init];
    for (int i = 0; i < 9; i ++) {
        UITableViewController * subViewController = [[UITableViewController alloc] init];
        subViewController.view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
        [controllers addObject:subViewController];
    }
    VC = [[ViewController alloc] initWithControllers:controllers titles:@[@"热门", @"新上榜", @"连载", @"生活家", @"世间事", @"@IT", @"市集", @"七日热门", @"三十日热门"]];
    VC.title = @"发现";
    RGBColor backgroundColor = [NSString hexStringToRGB:@"#0099CC"];
    RGBColor titleColor = [NSString hexStringToRGB:@"#FF6666"];
    RGBColor selectedColor = [NSString hexStringToRGB:@"#CCCCCC"];
    
    
    VC.menuBackgroundColor = COLOR_WITH_RGB_VALUE(backgroundColor);
    VC.menuTitleColor = COLOR_WITH_RGB_VALUE(titleColor);
    VC.menuSelecteColor = COLOR_WITH_RGB_VALUE(selectedColor);
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:VC];
    _window.rootViewController = nav;
    [_window makeKeyAndVisible];
    return YES;
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
