//
//  SecondViewController.m
//  trip
//
//  Created by 孙林鹏 on 15/12/2.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//

#import "SecondViewController.h"
#import "ThemeCell.h"
#import "MMProgressHUD.h"
#import "MJRefresh.h"
@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *imageArr;
    NSArray *priceArr;
    UITableView *MytableView;
    NSArray *titleArr;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-104) style:UITableViewStylePlain];
    MytableView.dataSource = self;
    MytableView.delegate = self;
    MytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:MytableView];
    [MytableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(@(self.view.frame.size.height-104));
    }];

    MytableView.showsVerticalScrollIndicator = NO;
    [MytableView registerNib:[UINib nibWithNibName:@"ThemeCell" bundle:nil] forCellReuseIdentifier:@"456"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self load];
    [self refreshAndLoading];
}
-(void)refreshAndLoading{
    [MytableView addHeaderWithCallback:^{
        if (isrefresh) {
            return ;
        }
        isrefresh = YES;
        [self load];
        isrefresh = NO;
        [MytableView headerEndRefreshing];
    }];
    [MytableView addFooterWithCallback:^{
        if (isLoading) {
            return ;
        }
        isLoading = YES;
        [self load];
        isLoading = NO;
        [MytableView footerEndRefreshing];
    }];
}
-(void)load{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleExpand];
    [MMProgressHUD showWithTitle:nil status:@"玩命加载中。。。"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:ThemeUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",responseObject);
        NSArray *array = responseObject[@"routeList"];
        NSMutableArray *mut1 = [[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray *mut2 = [[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray *mut3 = [[NSMutableArray alloc]initWithCapacity:0];
        for (NSDictionary *dic in array) {
            NSString *str1 = dic[@"url"];
            NSString *str2 = dic[@"goutripPrice"];
            NSString *str3 = dic[@"name"];
            [mut1 addObject:str1];
            [mut2 addObject:str2];
            [mut3 addObject:str3];
        }
        imageArr = mut1;
        priceArr = mut2;
        titleArr = mut3;
        [MytableView reloadData];
        [MMProgressHUD dismissWithSuccess:@"加载完成👼"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error.description);
    }];
}
#pragma UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return imageArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ThemeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"456" forIndexPath:indexPath];
    [cell.bgImageview sd_setImageWithURL:[NSURL URLWithString:imageArr[indexPath.row]]];
    cell.PriceLB.text = [NSString stringWithFormat:@"¥%@",priceArr[indexPath.row]];
    cell.titleLB.text = titleArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 206;
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
