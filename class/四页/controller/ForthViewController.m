//
//  ForthViewController.m
//  trip
//
//  Created by 孙林鹏 on 15/12/2.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//566109dd67e58e90a20008a3   appkey

#import "ForthViewController.h"
#import "RegisterViewController.h"
#import "FirstViewController.h"
#import "AllAnimation.h"
#import "UMSocial.h"
#import "UMSocialQQHandler.h"
#import "AppDelegate.h"
@interface ForthViewController ()<UINavigationControllerDelegate>
{
    NSString *userName;
    NSString *uid;
    UIView *view;
}
@end

@implementation ForthViewController
-(void)viewWillAppear:(BOOL)animated{
    [AllAnimation AnimationWithTitleLabel:_imageView withView:self.view];
    [AllAnimation AnimationWithTitleLabel:_weixinimageview withView:self.view];
    [AllAnimation AnimationWithTitleLabel:_weiboimageview withView:self.view];
    [AllAnimation AnimationWithTitleLabel:_qqimageView withView:self.view];
    [AllAnimation AnimationWithTitleLabel:_textField1 withView:self.view];
    [AllAnimation AnimationWithTitleLabel:_textfield2 withView:self.view];
    [AllAnimation AnimationWithTitleLabel:_forgetimageview withView:self.view];
    [AllAnimation AnimationWithTitleLabel:_registerimageview withView:self.view];
    self.tabBarController.tabBar.hidden=YES;

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_back1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(back)];

    self.navigationItem.leftBarButtonItem = item;
    _imageView.transform = CGAffineTransformMakeTranslation(0, -200);
    _weiboimageview.transform = CGAffineTransformMakeTranslation(0, 200);
    _weixinimageview.transform = CGAffineTransformMakeTranslation(0, 200);
    _qqimageView.transform = CGAffineTransformMakeTranslation(0, 200);
    _textField1.transform = CGAffineTransformMakeTranslation(-200, 0);
    _textfield2.transform = CGAffineTransformMakeTranslation(200, 0);
    _forgetimageview.transform = CGAffineTransformMakeTranslation(-200, 0);
    _registerimageview.transform = CGAffineTransformMakeTranslation(200, 0);
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)back{
    //这里的返回按钮可以返回到主页面
//    self.navigationController.tabBarController.hidesBottomBarWhenPushed=NO;
//    self.hidesBottomBarWhenPushed = NO;
    self.navigationController.tabBarController.selectedIndex=0;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(  *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)LoginBn:(id)sender {
   static BOOL is = YES;
    if (is == YES) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height/2-100)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
        lab.text = @"密码输入错误";
        lab.textColor = [UIColor redColor];
//        lab.backgroundColor = [UIColor blueColor];
        [view addSubview:lab];
        view.alpha = 0.5;
        [self.view addSubview:view];
        is = NO;
    }else{
        view.hidden = YES;
        is = YES;
    }
    
}

- (IBAction)Forget:(id)sender {
}

- (IBAction)Register:(id)sender {
    RegisterViewController *reg = [[RegisterViewController alloc]init];
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:reg animated:YES];
}

- (IBAction)weibo:(id)sender {
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
    
}

- (IBAction)QQ:(id)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
            userName = snsAccount.userName;
            uid = snsAccount.usid;
            NSLog(@"%@=====%@",userName,uid);
            [self success];//登录成功后需要做的事
//            NSLog(@"姓名username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
}
-(void)success{
    NSLog(@"登录成功");
    AFHTTPRequestOperationManager *maneger = [AFHTTPRequestOperationManager manager];
    [maneger POST:HomeUrl parameters:nil constructingBodyWithBlock:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
- (IBAction)weixin:(id)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:UMShareToWechatSession];
            
            NSLog(@"姓名username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
//            //得到的数据在回调Block对象形参respone的data属性
//            [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToWechatSession  completion:^(UMSocialResponseEntity *response){
//                NSLog(@"SnsInformation is %@",response.data);
//            }];
        }
        
    });
}
@end
