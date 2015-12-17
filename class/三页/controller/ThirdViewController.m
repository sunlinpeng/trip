//
//  ThirdViewController.m
//  trip
//
//  Created by 孙林鹏 on 15/12/2.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//

#import "ThirdViewController.h"
#import "CityCell.h"
#import "DateCell.h"
#import "StarCell.h"
#import "PriceCell.h"
#import "KeyCell.h"
#import "MyMD5.h"
#import "AFNetworking.h"
@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *MytableView;
}
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    MytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-104-60*4 ) style:UITableViewStylePlain];
    MytableView.dataSource = self;
    MytableView.delegate = self;
    [self.view addSubview:MytableView];
    [MytableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(@(self.view.frame.size.height-104-60*4 ));
    }];
    [MytableView registerNib:[UINib nibWithNibName:@"CityCell" bundle:nil] forCellReuseIdentifier:@"hello"];
    [MytableView registerNib:[UINib nibWithNibName:@"DateCell" bundle:nil] forCellReuseIdentifier:@"hello1"];
    [MytableView registerNib:[UINib nibWithNibName:@"StarCell" bundle:nil] forCellReuseIdentifier:@"hello2"];
    [MytableView registerNib:[UINib nibWithNibName:@"PriceCell" bundle:nil] forCellReuseIdentifier:@"hello3"];
    [MytableView registerNib:[UINib nibWithNibName:@"KeyCell" bundle:nil] forCellReuseIdentifier:@"hello4"];
    MytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    MytableView.showsVerticalScrollIndicator = NO;
    [self button];
    NSString *str = @"1234";
    NSString *st = [MyMD5 md5:str];
    NSLog(@"加密%@",st);
}
-(void)button{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(MytableView.mas_bottom).offset(30);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@40);
    }];
    
}
-(void)btn{
    
}
#pragma UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hello" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 1){
        DateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hello1" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 2){
        StarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hello2" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 3){
        PriceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hello3" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        KeyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hello4" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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
