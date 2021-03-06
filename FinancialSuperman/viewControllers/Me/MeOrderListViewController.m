//
//  MeOrderListViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MeOrderListViewController.h"

@interface MeOrderListViewController ()

@end

@implementation MeOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArray = [NSMutableArray array];
    _statusOrderedArray = [NSMutableArray array];
    _statusContractedArray = [NSMutableArray array];
    _statusPayedArray = [NSMutableArray array];
    
    UIView* footView = [UIView new];
    footView.backgroundColor = [UIColor clearColor];
    [_tableView setTableFooterView:footView];
    
    if ([USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [self updateOrderList];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateOrderList) name:NSNotificationCenter_userbeLogin object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateOrderList) name:NSNotificationCenter_userOrderProduct object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    NSUInteger sectionNum = 0;
    if (_statusOrderedArray.count) {
        sectionNum ++;
    }
    if (_statusContractedArray.count) {
        sectionNum ++;
    }
    if (_statusPayedArray.count) {
        sectionNum ++;
    }
    return sectionNum;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return _statusOrderedArray.count;
    }
    if (section == 1) {
        return _statusContractedArray.count;
    }
    if (section == 2) {
        return _statusPayedArray.count;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    _cell = [tableView dequeueReusableCellWithIdentifier:@"orderListHeaderCellIdentifier"];
    UILabel* label1 = (UILabel*)[_cell viewWithTag:1];
    UILabel* label2 = (UILabel*)[_cell viewWithTag:2];
    UILabel* label3 = (UILabel*)[_cell viewWithTag:3];
//    UILabel* label4 = (UILabel*)[_cell viewWithTag:4];
    if (section == 0) {
        label1.textColor = [UIColor getColor:@"F79C40"];
    }
    if (section == 1) {
        label1.textColor = [UIColor blackColor];
        label2.textColor = [UIColor getColor:@"F79C40"];
    }
    if (section == 2) {
        label1.textColor = [UIColor blackColor];
        label2.textColor = [UIColor blackColor];
        label3.textColor = [UIColor getColor:@"F79C40"];
    }
    return _cell.contentView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _cell = [tableView dequeueReusableCellWithIdentifier:@"orderListCellIdentifier" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        _orderProductModel =  [_statusOrderedArray objectAtIndex:indexPath.row];
    }else if (indexPath.section == 1){
        _orderProductModel =  [_statusContractedArray objectAtIndex:indexPath.row];
    }else if (indexPath.section == 2){
       _orderProductModel =  [_statusPayedArray objectAtIndex:indexPath.row];
    }
    
    UILabel* nameLabel = (UILabel*)[_cell viewWithTag:1];
    UILabel* countLabel = (UILabel*)[_cell viewWithTag:2];
    UILabel* timeLabel = (UILabel*)[_cell viewWithTag:3];
    UILabel* orderLabel = (UILabel*)[_cell viewWithTag:4];
    nameLabel.text = _orderProductModel.product_name;
    [countLabel setAttributedText:[NSMutableAttributedString instanceupStr:_orderProductModel.product_price downStr:@"万" upColor:[UIColor lightGrayColor] downColor:[UIColor lightGrayColor] upFont:[UIFont systemFontOfSize:13.0f] downFont:[UIFont systemFontOfSize:11.0f]]];
    timeLabel.text = _orderProductModel.add_time;
    orderLabel.text = _orderProductModel.customer_name;
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        _orderProductModel =  [_statusOrderedArray objectAtIndex:indexPath.row];
    }else if (indexPath.section == 1){
        _orderProductModel =  [_statusContractedArray objectAtIndex:indexPath.row];
    }else if (indexPath.section == 2){
        _orderProductModel =  [_statusPayedArray objectAtIndex:indexPath.row];
    }
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(MeOrderListViewController_CellSelected:)]) {
        [self.delegate MeOrderListViewController_CellSelected:_orderProductModel];
    }
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
-(void)updateOrderList
{
    [self startLoadView:_tableView];
    [HttpRequest orderProductListRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO]] forKeys:@[@"token"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_OrderList];
}

#pragma mark -
#pragma mark UIViewControllerLoadViewDelegate
-(void)refreshAction
{
    [self startLoadView:_tableView];
    [HttpRequest orderProductListRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO]] forKeys:@[@"token"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_OrderList];
}

#pragma mark http result
-(void) GetErr:(ASIHTTPRequest *)request
{
    [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
    if (request.tag == TAG_Product_OrderList) {
        [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
        [self mistakeLoadView];
    }
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
        if (request.tag == TAG_Product_OrderList) {
            if(![[dictionary objectForKey:@"code"] isEqualToString:@"1"]){
                [ProgressHUD showError:[dictionary objectForKey:@"message"]];
            }else{
                
                NSMutableArray* productArry = [dictionary objectForKey:@"bookings"];
                for (id dic in productArry) {
                    _orderProductModel = [[orderProductModel alloc]initWithDictionary:dic];
                    [_dataArray addObject:_orderProductModel];
                    if ([_orderProductModel.order_type isEqualToString:order_type_booking]) {
                        [_statusOrderedArray addObject:_orderProductModel];
                    }else if ([_orderProductModel.order_type isEqualToString:order_type_contract]) {
                        [_statusContractedArray addObject:_orderProductModel];
                    }else if ([_orderProductModel.order_type isEqualToString:order_type_prepay]) {
                        [_statusPayedArray addObject:_orderProductModel];
                    }
                }
                if (_dataArray.count) {
                    [_emptylabel removeFromSuperview];
                    _emptylabel = nil;
                    [self.tableView reloadData];
                }else{
                    if (_emptylabel == nil) {
                        _emptylabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, DEVICE_WIDTH, 40)];
                        _emptylabel.backgroundColor = [UIColor clearColor];
                        _emptylabel.textAlignment = NSTextAlignmentCenter;
                        _emptylabel.text = @"亲，您还没有预约的产品~";
                        _emptylabel.textColor = [UIColor grayColor];
                    }
                    [_tableView addSubview:_emptylabel];
                }
                [self endLoadView];
            }
        }else if (request.tag == TAG_Product_Focus){
            
        }
    }else{
        [ProgressHUD showError:@"数据出错！"];
        if (request.tag == TAG_Product_OrderList) {
            [self mistakeLoadView];
        }
    }
}
@end
