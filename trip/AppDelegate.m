//
//  AppDelegate.m
//  trip
//
//  Created by 孙林鹏 on 15/12/2.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//

#import "AppDelegate.h"
#import "SLPNavigationController.h"
#import "SLPTabBarController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [self tab];
    [self.window makeKeyAndVisible];
    [self setNavigationBarTheme];
    return YES;
}
#pragma mark - 设置导航栏主题
- (void)setNavigationBarTheme
{
    // 1.导航栏
    // 1.1.操作navBar相当操作整个应用中的所有导航栏
    
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 1.2.设置导航栏背景
    //[navBar setBarTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"head_bg.png"]]];
    // [navBar setBackgroundImage:[UIImage imageNamed:@"head_bg.png"] forBarMetrics:UIBarMetricsDefault];
    navBar.barTintColor = UIColorFromRGB(0x1C90FF);
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    dic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:dic];
}

-(UITabBarController*)tab{
    FirstViewController *first = [[FirstViewController alloc]init];
    SecondViewController *second = [[SecondViewController alloc]init];
    ThirdViewController *third = [[ThirdViewController alloc]init];
    ForthViewController *forth = [[ForthViewController alloc]init];
    
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:first];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:second];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:third];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:forth];
    
    nav1.tabBarItem.title = @"主页";
    first.navigationItem.title = @"GouTrip";
//    nav1.navigationBar.barTintColor = UIColorFromRGB(0x1C90FF);
    nav1.tabBarItem.image = [UIImage imageNamed:@"nav_home"];
    nav1.tabBarItem.selectedImage = [UIImage imageNamed:@"nav_homeh"];
    
    nav2.tabBarItem.title = @"主题游";
    second.navigationItem.title = @"GouTrip";
    nav2.tabBarItem.image = [UIImage imageNamed:@"nav_theme"];
    nav2.tabBarItem.selectedImage = [UIImage imageNamed:@"nav_themeh"];
    
    nav3.tabBarItem.title = @"资讯";
    third.navigationItem.title = @"GouTrip";
    nav3.tabBarItem.image = [UIImage imageNamed:@"nav_hotel"];
    nav3.tabBarItem.selectedImage = [UIImage imageNamed:@"nav_hotelh"];
    
    nav4.tabBarItem.title = @"我的";
    forth.navigationItem.title = @"用户登录";
    nav4.tabBarItem.image = [UIImage imageNamed:@"nav_center"];
    nav4.tabBarItem.selectedImage = [UIImage imageNamed:@"nav_centerh"];
    
    UITabBarController *tab = [[UITabBarController alloc]init];
    tab.viewControllers = @[nav1,nav2,nav3,nav4];
    return tab;
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
