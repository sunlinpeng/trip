//
//  AllAnimation.h
//  trip
//
//  Created by 孙林鹏 on 15/12/4.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AllAnimation : NSObject
+ (void)AnimationWithTitleLabel:(UIImageView*)label  withView:(UIView*)view;
+ (void)textFieldBottomLineAnimationWithConstraint:(NSLayoutConstraint *)constraint WithView:(UIView *)view;

@end
