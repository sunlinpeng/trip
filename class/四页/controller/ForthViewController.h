//
//  ForthViewController.h
//  trip
//
//  Created by 孙林鹏 on 15/12/2.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForthViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textfield2;
- (IBAction)LoginBn:(id)sender;
- (IBAction)Forget:(id)sender;
- (IBAction)Register:(id)sender;
- (IBAction)weibo:(id)sender;
- (IBAction)QQ:(id)sender;
- (IBAction)weixin:(id)sender;

@end
