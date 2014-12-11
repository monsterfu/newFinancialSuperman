//
//  MeOrderDetailViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-12-9.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MeOrderDetailViewController.h"
#import "productDetailViewController.h"

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
    
    UIView* _footView = [UIView new];
    [_footView setBackgroundColor:[UIColor clearColor]];
    [_tableView setTableFooterView:_footView];
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
        if (indexPath.row == 1) {
            detailLabel.text = _orderProductModel.order_id;
        }else if (indexPath.row == 2) {
            detailLabel.text = _orderProductModel.add_time;
        }else if (indexPath.row == 3) {
            detailLabel.text = _orderProductModel.customer_name;
        }else if (indexPath.row == 4) {
            detailLabel.text = _orderProductModel.product_price;
        }else if (indexPath.row == 5) {
            detailLabel.text = _orderProductModel.return_commission;
        }else if (indexPath.row == 6) {
            detailLabel.text = _orderProductModel.expected_return;
        }else if (indexPath.row == 7) {
            detailLabel.text = _orderProductModel.order_status;
        }else if (indexPath.row == 8) {
            detailLabel.text = _orderProductModel.status_reason;
        }else if (indexPath.row == 9) {
            detailLabel.text = _orderProductModel.customer_comment;
        }
    }
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UIStoryboard* mainBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        productDetailViewController* vc = [mainBoard instantiateViewControllerWithIdentifier:@"productDetailViewControllerIdentifier"];
        vc.orderProductOne = _orderProductModel;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}


@end
