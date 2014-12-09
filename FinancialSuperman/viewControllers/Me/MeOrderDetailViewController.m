//
//  MeOrderDetailViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-12-9.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MeOrderDetailViewController.h"

@interface MeOrderDetailViewController ()

@end

@implementation MeOrderDetailViewController

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _titleArray = @[@"订单编号",@"预约日期",@"客户姓名",@"预约金额",@"年化收益",@"返佣金额",@"交易状态",@"状态原因",@"备注"];
    self.title = @"订单信息";
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
//orderDetailCellIOnedentifier


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _titleArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        _cell = [tableView dequeueReusableCellWithIdentifier:@"orderDetailCellIOnedentifier" forIndexPath:indexPath];
        UILabel* nameLabel = (UILabel*)[_cell viewWithTag:2];
        nameLabel.text = _orderProductModel.product_name;
    }else{
        _cell = [tableView dequeueReusableCellWithIdentifier:@"orderDetailCellITwodentifier" forIndexPath:indexPath];
        UILabel* titleLabel = (UILabel*)[_cell viewWithTag:1];
        titleLabel.text = [_titleArray objectAtIndex:indexPath.row - 1];
        UILabel* detailLabel = (UILabel*)[_cell viewWithTag:2];
        detailLabel.text = _orderProductModel.product_name;
    }
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
    }
    
    
}


@end
