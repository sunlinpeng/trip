//
//  SLPNavigationController.m
//  123
//
//  Created by 孙林鹏 on 15/11/20.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//

#import "SLPNavigationController.h"

@interface SLPNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SLPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //更新状态栏风格,这种写法，如果有navigationController一定要写在navigationController里面
    [self setNeedsStatusBarAppearanceUpdate];
    
    //启用返回手势
    self.interactivePopGestureRecognizer.delegate = self;
    
    //设置标题颜色，标题的字体
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:12]};
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return YES;
}

/*
 重写这个方法来判断启用和禁用返回手势
 */

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController * vc = [super popViewControllerAnimated:animated];
    //IOS 7返回手势的启用和禁用
    if (self.viewControllers.count > 0) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }else
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return vc;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
