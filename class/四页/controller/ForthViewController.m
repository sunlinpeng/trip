//
//  ForthViewController.m
//  trip
//
//  Created by 孙林鹏 on 15/12/2.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//

#import "ForthViewController.h"
#import "RegisterViewController.h"
#import "FirstViewController.h"
@interface ForthViewController ()<UINavigationControllerDelegate>

@end

@implementation ForthViewController
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_back1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = item;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)back{
    FirstViewController *first = [[FirstViewController alloc]init];
    [self.navigationController pushViewController:first animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)LoginBn:(id)sender {
}

- (IBAction)Forget:(id)sender {
}

- (IBAction)Register:(id)sender {
    RegisterViewController *reg = [[RegisterViewController alloc]init];
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:reg animated:YES];
}

- (IBAction)weibo:(id)sender {
}

- (IBAction)QQ:(id)sender {
}

- (IBAction)weixin:(id)sender {
}
@end
