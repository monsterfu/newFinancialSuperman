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

#define customCell_height      (44)

@interface OnListDetailsubTableController ()

@end

@implementation OnListDetailsubTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _rgxzTitleArray = @[@"成立日期:",@"开放日期:",@"认购起点:",@"认购费用:",@"退出费用:",@"管理费用:"];
    _xxxxTitleArray = @[@"产品状态",@"发行平台",@"托管银行",@"证券经纪",@"基金性质",@"投资类型",@"是否结构化",@"基金经理",@"私募公司",@"投资理念",@"投资团队"];
    
    
    UIView* footView = [UIView new];
    [footView setBackgroundColor:[UIColor clearColor]];
    [_tableView setTableFooterView:footView];
    
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
    self.lineGraphView.delegate = self;
    self.lineGraphView.enableTouchReport = YES;
    self.lineGraphView.colorTop = [UIColor clearColor];
    self.lineGraphView.colorBottom = [UIColor clearColor]; // Leaving this not-set on iOS 7 will default to your window's tintColor
    self.lineGraphView.colorLine = [UIColor whiteColor];
    self.lineGraphView.backgroundColor = [UIColor clearColor];
    self.lineGraphView.colorXaxisLabel = [UIColor whiteColor];
    self.lineGraphView.widthLine = 3.0;
    self.lineGraphView.enableTouchReport = YES;
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
            _cell = [tableView dequeueReusableCellWithIdentifier:custerIdentifier forIndexPath:indexPath];
            _cell.textLabel.text = [_rgxzTitleArray objectAtIndex:indexPath.row];
            return _cell;
        }
            break;
        case EnumTypeTable_rgxz:
        {
            _cell = [tableView dequeueReusableCellWithIdentifier:custerIdentifier forIndexPath:indexPath];
            UILabel* _label = (UILabel*)[_cell viewWithTag:1];
            _label.text = [_rgxzTitleArray objectAtIndex:indexPath.row];
            return _cell;
        }
            break;
        case EnumTypeTable_xxxx:
        {
            if (indexPath.row > 6) {
                _sksCell = [tableView dequeueReusableCellWithIdentifier:sksCusterIdentifier forIndexPath:indexPath];
                UILabel* _label = (UILabel*)[_cell viewWithTag:1];
                _label.text = [_xxxxTitleArray objectAtIndex:indexPath.row];
                return _sksCell;
            }else{
                _cell = [tableView dequeueReusableCellWithIdentifier:custerIdentifier forIndexPath:indexPath];
                UILabel* _label = (UILabel*)[_cell viewWithTag:1];
                _label.text = [_xxxxTitleArray objectAtIndex:indexPath.row];
                return _cell;
            }
            return _cell;
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

@end
