//
//  MeCommissionViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-2.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface MeCommissionViewController : baseLoadViewController<UIViewControllerLoadViewDelegate,SKSTableViewDelegate>
{
    orderProductModel* _orderProductModel;
    UITableViewCell* _cell;
    UserDetailModel* _model;
    NSMutableArray* _statusReturnedArray;               //已合同
    NSMutableArray* _statusReturninArray;               //已付款
}

@property (weak, nonatomic) IBOutlet SKSTableView *tableView;
@end
