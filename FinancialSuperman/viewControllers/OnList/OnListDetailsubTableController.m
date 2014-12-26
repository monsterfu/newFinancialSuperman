//
//  OnListDetailsubTableController.m
//  FinancialSuperman
//
//  Created by Monster on 14/12/25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "OnListDetailsubTableController.h"
#define custerIdentifier                @"customerCellIdentifier"
#define sksCusterIdentifier             @"sksCustomerCellIdentifier"
#define fyflHeaderCellIdentifier        @"fyflHeaderCellIdentifier"
#define fyflContentCellIdentifier       @"fyflContentCellIdentifier"
#define customerLabelCellIdentifier     @"customerLabelCellIdentifier"
#define bemLineCellIdentifier           @"bemLineCellIdentifier"



@interface OnListDetailsubTableController ()

@end

@implementation OnListDetailsubTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _rgxzTitleArray = @[@"成立日期: ",@"开放日期: ",@"认购起点: ",@"认购费用: ",@"退出费用: ",@"管理费用: "];
    _xxxxTitleArray = @[@"产品状态: ",@"发行平台: ",@"托管银行: ",@"证券经纪: ",@"基金性质: ",@"投资类型: ",@"是否结构化: ",@"基金经理: ",@"私募公司: ",@"投资理念: ",@"投资团队: "];
    
    
    UIView* footView = [UIView new];
    [footView setBackgroundColor:[UIColor clearColor]];
    [_tableView setTableFooterView:footView];
    
    
    self.ArrayOfValues = [[NSMutableArray alloc] init];
    self.ArrayOfDates = [[NSMutableArray alloc] init];
    
    for (int i=0; i < 66; i++) {
        [self.ArrayOfValues addObject:[NSNumber numberWithInteger:(arc4random() % 70000)]]; // Random values for the graph
        [self.ArrayOfDates addObject:[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:2000 + i]]]; // Dates for the X-Axis of the graph
        
        //        totalNumber = totalNumber + [[self.ArrayOfValues objectAtIndex:i] intValue]; // All of the values added together
    }
    
    /* This is commented out because the graph is created in the interface with this sample app. However, the code remains as an example for creating the graph using code.
     BEMSimpleLineGraphView *myGraph = [[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0, 60, 320, 250)];
     myGraph.delegate = self;
     [self.view addSubview:myGraph]; */
    
    // Customization of the graph
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
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (_tableEnum) {
        case EnumTypeTable_jzzs:
        {
            return 300;
        }
            break;
        case EnumTypeTable_rgxz:
        {
            return customCell_height;
        }
            break;
        case EnumTypeTable_xxxx:
        {
            return customCell_height;
        }
            break;
        case EnumTypeTable_fyfl:
        {
            return customCell_height;
        }
            break;
        default:
            return 0;
            break;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (_tableEnum) {
        case EnumTypeTable_jzzs:
        {
            return 1;
        }
            break;
            case EnumTypeTable_rgxz:
        {
            return [_rgxzTitleArray count];
        }
            break;
            case EnumTypeTable_xxxx:
        {
            return [_xxxxTitleArray count];
        }
            break;
            case EnumTypeTable_fyfl:
        {
            return 2;
        }
            break;
        default:
            return 0;
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (_tableEnum == EnumTypeTable_fyfl) {
        _headerCell = [tableView dequeueReusableCellWithIdentifier:@"fyflHeaderCellIdentifier"];
        return _headerCell.contentView;
    }
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (_tableEnum) {
        case EnumTypeTable_jzzs:
        {
            _bemLineCell = [tableView dequeueReusableCellWithIdentifier:bemLineCellIdentifier forIndexPath:indexPath];
            _bemLineCell.lineGraphView.delegate = self;
            _bemLineCell.lineGraphView.enableTouchReport = YES;
            _bemLineCell.lineGraphView.colorTop = [UIColor clearColor];
            _bemLineCell.lineGraphView.colorBottom = [UIColor clearColor]; // Leaving this not-set on iOS 7 will default to your window's tintColor
            _bemLineCell.lineGraphView.colorLine = [UIColor blueColor];
            _bemLineCell.lineGraphView.backgroundColor = [UIColor clearColor];
            _bemLineCell.lineGraphView.colorXaxisLabel = [UIColor whiteColor];
            _bemLineCell.lineGraphView.widthLine = 3.0;
            _bemLineCell.lineGraphView.enableTouchReport = YES;
            
            return _bemLineCell;
        }
            break;
        case EnumTypeTable_rgxz:
        {
            _cell = [tableView dequeueReusableCellWithIdentifier:custerIdentifier forIndexPath:indexPath];
            UILabel* _label = (UILabel*)[_cell viewWithTag:1];
            NSString* contentStr = [_rgxzTitleArray objectAtIndex:indexPath.row];
            if (indexPath.row == 0) {
                _label.text = [contentStr stringByAppendingString:_productOne.foundation_date];
            }else if (indexPath.row == 1){
                _label.text = [contentStr stringByAppendingString:_productOne.open_date];
            }else if (indexPath.row == 2){
                _label.text = [contentStr stringByAppendingString:_productOne.investment_amount];
            }else if (indexPath.row == 3){
                _label.text = [contentStr stringByAppendingString:_productOne.buy_rate];
            }else if (indexPath.row == 4){
                _label.text = [contentStr stringByAppendingString:_productOne.exit_rate];
            }else if (indexPath.row == 5){
                _label.text = [contentStr stringByAppendingString:_productOne.management_rate];
            }
            return _cell;
        }
            break;
        case EnumTypeTable_xxxx:
        {
            if (indexPath.row > 6) {
                _sksCell = [tableView dequeueReusableCellWithIdentifier:sksCusterIdentifier forIndexPath:indexPath];
                _sksCell.isExpandable = YES;
                UILabel* _label = (UILabel*)[_sksCell viewWithTag:1];
                _label.text = [_xxxxTitleArray objectAtIndex:indexPath.row];
                return _sksCell;
            }else{
                _cell = [tableView dequeueReusableCellWithIdentifier:custerIdentifier forIndexPath:indexPath];
                UILabel* _label = (UILabel*)[_cell viewWithTag:1];
                NSString* contentStr = [_xxxxTitleArray objectAtIndex:indexPath.row];
                if (indexPath.row == 0) {
                    _label.text = [contentStr stringByAppendingString:@"进行中"];
                }else if (indexPath.row == 1){
                    _label.text = [contentStr stringByAppendingString:_productOne.baseInfo.issuer];
                }else if (indexPath.row == 2){
                    _label.text = [contentStr stringByAppendingString:_productOne.trusteeship_bank];
                }else if (indexPath.row == 3){
                    _label.text = [contentStr stringByAppendingString:_productOne.stock_broker];
                }else if (indexPath.row == 4){
                    _label.text = [contentStr stringByAppendingString:_productOne.found_character];
                }else if (indexPath.row == 5){
                    _label.text = [contentStr stringByAppendingString:_productOne.baseInfo.product_category];
                }else if (indexPath.row == 6){
                    _label.text = [contentStr stringByAppendingString:_productOne.is_structured];
                }
                return _cell;
            }
        }
            break;
        case EnumTypeTable_fyfl:
        {
            _cell = [tableView dequeueReusableCellWithIdentifier:fyflContentCellIdentifier forIndexPath:indexPath];
            
            return _cell;
        }
            break;
        default:
            return nil;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
{    
    _cell = [tableView dequeueReusableCellWithIdentifier:customerLabelCellIdentifier];
        
    return _cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark - SimpleLineGraph Data Source

- (int)numberOfPointsInGraph {
    return (int)[self.ArrayOfValues count];
}

- (float)valueForIndex:(NSInteger)index {
    return [[self.ArrayOfValues objectAtIndex:index] floatValue];
}


#pragma mark - SimpleLineGraph Delegate

- (int)numberOfGapsBetweenLabels {
    return 1;
}

- (NSString *)labelOnXAxisForIndex:(NSInteger)index {
    return [self.ArrayOfDates objectAtIndex:index];
}
@end
