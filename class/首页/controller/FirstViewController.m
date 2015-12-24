//
//  FirstViewController.m
//  trip
//
//  Created by 孙林鹏 on 15/12/2.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//

#import "FirstViewController.h"
#import "LCBannerView.h"
#import "SaleCell.h"
#import "UIImageView+WebCache.h"
#import "ThemeCell.h"
#import "MJRefresh.h"
#import "MMProgressHUD.h"
#import "Masonry.h"
@interface FirstViewController ()<LCBannerViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSArray *ScrollArr;
    LCBannerView *view;
    NSArray *SaleArr;
    UITableView *MyTableView;
    NSArray *routeArr;
    NSArray *titleArr;
    NSArray *priceArr;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    MyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-104) style:UITableViewStylePlain];
    MyTableView.delegate = self;
    MyTableView.dataSource = self;
    MyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [MyTableView registerNib:[UINib nibWithNibName:@"ThemeCell" bundle:nil] forCellReuseIdentifier:@"456"];
    [MyTableView registerNib:[UINib nibWithNibName:@"SaleCell" bundle:nil] forCellReuseIdentifier:@"123"];
    [self.view addSubview:MyTableView];
    [MyTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(@(self.view.frame.size.height-104));
    }];
//    [self fun5];
    [self load];
    [self refreshAndLoading];

}
-(void)refreshAndLoading{
   [MyTableView addHeaderWithCallback:^{
       if (isrefresh) {
           return ;
       }
       isrefresh = YES;
       [self load];
       isrefresh = NO;
       [MyTableView headerEndRefreshing];
   }];
    [MyTableView addFooterWithCallback:^{
        if (isLoading) {
            return ;
        }
        isLoading = YES;
        [self load];
        isLoading =NO;
        [MyTableView footerEndRefreshing];
    }];
}
-(void)load{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleExpand];
    [MMProgressHUD showWithTitle:nil status:@"玩命加载中..."];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:HomeUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSArray *array = responseObject[@"bannerList"];
        NSMutableArray *mutArr = [[NSMutableArray alloc]initWithCapacity:0];
        for (NSDictionary *dic in array) {
            NSString *str = dic[@"imageUrl"];
            [mutArr addObject:str];
        }
        ScrollArr = mutArr;
        [MyTableView reloadData];
        [self Scroll];
        //        NSLog(@"%@",ScrollArr);
        
        NSArray *array1 = responseObject[@"favorableList"];
        NSMutableArray *mutArr1 = [[NSMutableArray alloc]initWithCapacity:0];
        for (NSDictionary *dic1 in array1) {
            NSString *str = dic1[@"imageUrl"];
            [mutArr1 addObject:str];
        }
        SaleArr = mutArr1;
//        NSLog(@"%@=========",SaleArr);
        [MyTableView reloadData];
        NSArray *array2 = responseObject[@"routeList"];
        NSMutableArray *mutArr2 = [[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray *mutArr3 = [[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray *mutArr4 = [[NSMutableArray alloc]initWithCapacity:0];
        for (NSDictionary *dic2 in array2) {
            NSString *str = dic2[@"url"];
            [mutArr2 addObject:str];
            NSString *str1 = dic2[@"title"];
//            NSLog(@"str1:====%@",str1);
            [mutArr3 addObject:str1];
            NSString *str2 = dic2[@"goutripPrice"];
            [mutArr4 addObject:str2];
        }
        routeArr = mutArr2;
        titleArr = mutArr3;
        priceArr = mutArr4;
//        NSLog(@"%@",priceArr);
        [MyTableView reloadData];
        [MMProgressHUD dismissWithSuccess:@"加载完成👼"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error.description);
    }];
}
////用延时队列来进行操作使图片的数据加载先加载出来在进行Scrollview的创建
//-(void)fun5{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self Scroll];
//    });
//}
-(void)Scroll{
    view = [[LCBannerView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 0.3*self.view.frame.size.height) delegate:self imageURLs:ScrollArr placeholderImage:@"news_loading" timerInterval:3 currentPageIndicatorTintColor:[UIColor grayColor] pageIndicatorTintColor:[UIColor whiteColor]];

    MyTableView.tableHeaderView = view;
}
//滚动视图点击事件
- (void)bannerView:(LCBannerView *)bannerView didClickedImageIndex:(NSInteger)index {
    
    NSLog(@"you clicked image in %@ at index: %ld", bannerView, (long)index);
}
#pragma UITableviewdatasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return routeArr.count-1;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SaleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSURL *url1 = [NSURL URLWithString:SaleArr[0]];
        NSURL *url2 = [NSURL URLWithString:SaleArr[1]];
        [cell.imageView1 sd_setImageWithURL:url1];
        [cell.imageView2 sd_setImageWithURL:url2];
        
        return cell;
    }else{
        ThemeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"456" forIndexPath:indexPath];
        [cell.bgImageview sd_setImageWithURL:[NSURL URLWithString:routeArr[indexPath.row+1]]];
        cell.titleLB.text = titleArr[indexPath.row+1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.PriceLB.text = [NSString stringWithFormat:@"¥%@",priceArr[indexPath.row+1]];
               return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 83;
    }else{
        return 206;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 50;
    }
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view11 = [[UIView alloc]init];
    view11.backgroundColor = [UIColor whiteColor];
    view11.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(10,12 , 20, 20);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageNamed:@"icon_fire.png"];
    [view11 addSubview:imageView];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(40, 14, 200, 20);
    label.text = @"最热主题线路";
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:16];
    [view11 addSubview:label];
    

    return view11;

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

@end
