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
#import "UMSocial.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"
#import "NewFeatureViewController.h"
//566109dd67e58e90a20008a3  appKey
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self setNavigationBarTheme];
    [UMSocialData setAppKey:@"566109dd67e58e90a20008a3"];
     [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.umeng.com/social"];
    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.umeng.com/social"];
    // 1 第一次的标识
    NSString *isFirst = @"isFirstDoMyApp8133111";//修改这里的唯一标识可以让app第一次运行时出现前面的引导页
    
    // 2 判断是否存才
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *firstString = [ud objectForKey:isFirst];
    
    // 3 执行 - 选择不同的根控制器
    if (firstString) {
        
        // 不是第一次运行
        [self startGoutrip];
    } else {
        
        // 是第一次运行 存储标识
        [ud setObject:@"GoutripFirst" forKey:isFirst];
        [ud synchronize];
        
        // 进入新特性控制器
        NewFeatureViewController *new = [[NewFeatureViewController alloc] init];
        new.startBlock = ^{
            
            // 开始ailvgo按钮block回调  更换跟控制器
            [self startGoutrip];
        };
        
        // 设置新特性控制器为根控制器
        self.window.rootViewController = new;
    }

    return YES;
}
-(void)startGoutrip{
    self.window.rootViewController = [self tab];

}

//微信、QQde回调方法
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];//登录成功此处的url改成登录的url
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
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
//禁止横屏
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
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
    nav1.tabBarItem.image = [UIImage imageNamed:@"tabbar_account.png"];
    nav1.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_account_press.png"];
    
    nav2.tabBarItem.title = @"主题游";
    second.navigationItem.title = @"GouTrip";
    nav2.tabBarItem.image = [UIImage imageNamed:@"tabbar_appfree.png"];
    nav2.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_appfree_press.png"];
    
    nav3.tabBarItem.title = @"资讯";
    third.navigationItem.title = @"GouTrip";
    nav3.tabBarItem.image = [UIImage imageNamed:@"tabbar_limitfree.png"];
    nav3.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_limitfree_press.png"];
    
    nav4.tabBarItem.title = @"我的";
    forth.navigationItem.title = @"用户登录";
    nav4.tabBarItem.image = [UIImage imageNamed:@"tabbar_rank.png"];
    nav4.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_rank_press.png"];
    
    UITabBarController *tab = [[UITabBarController alloc]init];
    tab.viewControllers = @[nav1,nav2,nav3,nav4];
    tab.selectedViewController = [tab.viewControllers objectAtIndex:1];//在这里设置默认首次展现的是哪个视图控制器
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
