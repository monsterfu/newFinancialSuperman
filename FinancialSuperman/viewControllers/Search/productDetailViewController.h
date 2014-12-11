//
//  productDetailViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"


@interface productDetailViewController : baseLoadViewController<UIAlertViewDelegate>
{
    NSMutableArray* _headerTitleArray;
    NSMutableArray* _baseInfoTitleArray;
    
    baseInfoTableViewController* _baseInfoViewController;
    orderViewController* _orderViewController;
    
    UIAlertView* _emailAlertView;
    UITextField* _emailTextField;
    
    NSString* _productId;
}

@property(nonatomic, retain)ProductOneParamModel* productOne;
@property(nonatomic, retain)attentionProductModel* attentionOne;
@property(nonatomic, retain)orderProductModel* orderProductOne;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITextField *textField;

//已预约人数
@property (weak, nonatomic) IBOutlet UILabel *alreadyBookNumLabel;
@end
