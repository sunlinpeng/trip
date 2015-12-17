//
//  NewFeatureViewController.m
//  trip
//
//  Created by 孙林鹏 on 15/12/7.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//

#import "NewFeatureViewController.h"
#define kCount 4
#define iPhone4S ([UIScreen mainScreen].bounds.size.height == 480)
#define iPhone5S ([UIScreen mainScreen].bounds.size.height == 568)
#define iPhone6S ([UIScreen mainScreen].bounds.size.height == 667)
#define iPhone6pS ([UIScreen mainScreen].bounds.size.height == 736)
@interface NewFeatureViewController ()<UIScrollViewDelegate>
{
    UIPageControl *_pageControl;
    UIButton *_share;
}

@end

@implementation NewFeatureViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    CGSize viewSize = self.view.bounds.size;
    
    // 1.加载UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(kCount * viewSize.width, 0);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    // 2.添加UIImageView
    for (int i = 0; i<kCount; i++) {
        [self addImageViewAtIndex:i inView:scrollView];
    }
}
#pragma mark 添加scrollview里面的imageview
- (void)addImageViewAtIndex:(int)index inView:(UIView *)view
{
    CGSize viewSize = self.view.frame.size;
    
    // 1.创建imageview
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor yellowColor];
    imageView.frame = (CGRect){{index * viewSize.width, 0} , viewSize};
    NSString *name = @"";
    if (iPhone4S) {
        
        name = [NSString stringWithFormat:@"4s_%d.png",index + 1];
    } else if (iPhone5S) {
        
        name = [NSString stringWithFormat:@"5s_%d.png",index + 1];
    } else if (iPhone6S) {
        
        name = [NSString stringWithFormat:@"6_%d.png",index + 1];
    } else {
        
        name = [NSString stringWithFormat:@"6s_%d.png",index + 1];
    }
    // 2.设置图片
    imageView.image = [UIImage imageNamed:name];
    
    // 3.添加
    [view addSubview:imageView];
    
    // 4.如果是最后一张图片，添加按钮（开始）
    if (index == kCount - 1) {
        [self addBtnInView:imageView];
    }
}
#pragma mark 添加按钮(开始)
- (void)addBtnInView:(UIView *)view
{
    CGSize viewSize = self.view.frame.size;
    view.userInteractionEnabled = YES;
    
    // 1.1.创建
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.backgroundColor = [UIColor clearColor];
    [view addSubview:start];
    
    // 1.3.边框
    start.center = CGPointMake(viewSize.width * 0.5, viewSize.height * 0.83);
    //start.bounds = (CGRect){CGPointZero, startSize};
    start.bounds = (CGRect){CGPointZero, {self.view.frame.size.width * 0.4,50}};
    
    // start.bounds = CGRectMake(0, 0, startNormal.size.width, startNormal.size.height);
    // 1.4.监听
    [start addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark 开始
- (void)start
{
    // 回调 appDelegate
    if (self.startBlock) {
        self.startBlock();
    }
}
#pragma mark 减速完毕就会调用（scrollview静止）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
