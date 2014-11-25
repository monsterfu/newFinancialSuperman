//
//  MeOrderListViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface MeOrderListViewController : baseLoadViewController<UIViewControllerLoadViewDelegate>
{
    orderProductModel* _orderProductModel;
    UILabel* _emptylabel;
    UITableViewCell* _cell;
    
    NSMutableArray* _statusOrderedArray;     //已预约
    NSMutableArray* _statusContractedArray;  //已合同
    NSMutableArray* _statusPayedArray;       //已付款
}

@property(nonatomic, retain)NSMutableArray* dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
