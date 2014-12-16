//
//  MeCommissionViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-2.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MeCommissionViewController.h"

@interface MeCommissionViewController ()

@end

@implementation MeCommissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _statusReturnedArray = [NSMutableArray array];
    _statusReturninArray = [NSMutableArray array];
    
    self.tableView.SKSTableViewDelegate = self;
    
    if ([USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [self updateUserDetail];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateUserDetail) name:NSNotificationCenter_userbeLogin object:nil];
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

#pragma mark - NotificationCenter_userbeLogin
-(void)updateUserDetail
{
    [self startLoadView:_tableView];
    [HttpRequest personDetailRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO]] forKeys:@[@"token"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_PersonDetail];
}
#pragma mark - Table view data source

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (NSInteger)tableView:(SKSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [_statusReturnedArray count];
    }else
        return [_statusReturninArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"commissionCellIdentifier";
    
    SKSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
    UILabel* earnLabel = (UILabel*)[cell viewWithTag:2];
    UILabel* orderNumLabel = (UILabel*)[cell viewWithTag:3];
    if (indexPath.row == 0) {
        titleLabel.text = @"累计佣金";
        cell.isExpandable = NO;
        if ([_statusReturnedArray count]) {
            cell.isExpandable = YES;
        }
        [earnLabel setAttributedText:[NSMutableAttributedString instanceupStr:_model.total_income downStr:@"元" upColor:COMMON_RED_COLOR downColor:[UIColor blackColor] upFont:[UIFont boldSystemFontOfSize:22.0f] downFont:[UIFont systemFontOfSize:14.0f]]];
        orderNumLabel.text = [NSString stringWithFormat:@"%@单",_model.returned_count];
    }else{
        titleLabel.text = @"预计未来佣金";
        cell.isExpandable = NO;
        if ([_statusReturninArray count]) {
            cell.isExpandable = YES;
        }
        [earnLabel setAttributedText:[NSMutableAttributedString instanceupStr:_model.expect_income downStr:@"元" upColor:COMMON_RED_COLOR downColor:[UIColor blackColor] upFont:[UIFont boldSystemFontOfSize:22.0f] downFont:[UIFont systemFontOfSize:14.0f]]];
        orderNumLabel.text = [NSString stringWithFormat:@"%@单",_model.returning_count];
    }
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"commissionDetailCellIdentifier";
    
    _cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (indexPath.row == 0) {
        _orderProductModel =  [_statusReturnedArray objectAtIndex:indexPath.subRow-1];
    }else {
        _orderProductModel =  [_statusReturninArray objectAtIndex:indexPath.subRow-1];
    }
    
    UILabel* nameLabel = (UILabel*)[_cell viewWithTag:1];
    UILabel* countLabel = (UILabel*)[_cell viewWithTag:2];
    UILabel* timeLabel = (UILabel*)[_cell viewWithTag:3];
    UILabel* orderLabel = (UILabel*)[_cell viewWithTag:4];
    nameLabel.text = _orderProductModel.product_name;
    [countLabel setAttributedText:[NSMutableAttributedString instanceupStr:_orderProductModel.product_price downStr:@"万" upColor:[UIColor lightGrayColor] downColor:[UIColor lightGrayColor] upFont:[UIFont systemFontOfSize:13.0f] downFont:[UIFont systemFontOfSize:11.0f]]];
    timeLabel.text = _orderProductModel.add_time;
    orderLabel.text = _orderProductModel.customer_name;
    
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"indexPath.subRow,indexPath.row:%ld,%ld",(long)indexPath.subRow,(long)indexPath.row);
//    if (indexPath.row == 0) {
//        SKSTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        if (cell.isExpanded) {
//            return;
//        }
//    }
//    
//    if (indexPath.row > 0 && indexPath.row <= [_statusReturnedArray count]) {
//        _orderProductModel =  [_statusReturnedArray objectAtIndex:indexPath.row-1];
//    }else{
//        _orderProductModel =  [_statusReturninArray objectAtIndex:indexPath.row-1 - [_statusReturnedArray count]];
//    }
//    [self.navigationController.tabBarController performSegueWithIdentifier:@"searchDetailIdentifier" sender:_orderProductModel];
}

#pragma mark -
#pragma mark UIViewControllerLoadViewDelegate
-(void)refreshAction
{
    [self startLoadView:_tableView];
    [HttpRequest personDetailRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO]] forKeys:@[@"token"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_PersonDetail];
}

#pragma mark http result
-(void) GetErr:(ASIHTTPRequest *)request
{
    [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
    [self mistakeLoadView];
}
-(void) GetResult:(ASIHTTPRequest *)request
{
    NSData *responseData = [request responseData];
    NSString*pageSource = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"pageSource:%@",pageSource);
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    NSLog(@"dic is %@",dictionary);
    if(dictionary!=nil){
        if (request.tag == TAG_PersonDetail) {
            if(![[dictionary objectForKey:@"code"] isEqualToString:@"1"])
            {
                [ProgressHUD showError:[dictionary objectForKey:@"message"]];
            }else{
                NSMutableDictionary* dic = [dictionary objectForKey:@"user"];
                _model = [[UserDetailModel alloc]initWithDictionary:dic];
                [HttpRequest orderProductListRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO]] forKeys:@[@"token"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_OrderList];
            }
        }else if (request.tag == TAG_Product_OrderList){
            if(![[dictionary objectForKey:@"code"] isEqualToString:@"1"]){
                [ProgressHUD showError:[dictionary objectForKey:@"message"]];
            }else{
                [_statusReturninArray removeAllObjects];
                [_statusReturnedArray removeAllObjects];
                NSMutableArray* productArry = [dictionary objectForKey:@"bookings"];
                for (id dic in productArry) {
                    _orderProductModel = [[orderProductModel alloc]initWithDictionary:dic];
                    if ([_orderProductModel.order_status_code isEqualToString:order_type_returned]) {
                        [_statusReturnedArray addObject:_orderProductModel];
                    }else if ([_orderProductModel.order_status_code isEqualToString:order_type_returnin]) {
                        [_statusReturninArray addObject:_orderProductModel];
                    }
                }
                [self.tableView reloadData];
                [self endLoadView];
            }
        }
    }else{
        [ProgressHUD showError:@"数据出错！"];
        [self mistakeLoadView];
    }
}
@end
