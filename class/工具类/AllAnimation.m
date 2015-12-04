//
//  AllAnimation.m
//  trip
//
//  Created by 孙林鹏 on 15/12/4.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//

#import "AllAnimation.h"

@implementation AllAnimation
+ (void)AnimationWithTitleLabel:(UILabel*)label  withView:(UIView*)view{
    [UIView animateWithDuration:1.0 animations:^{
        label.transform = CGAffineTransformIdentity;
    }];
}
+ (void)textFieldBottomLineAnimationWithConstraint:(NSLayoutConstraint *)constraint WithView:(UIView *)view{
    
}
@end
