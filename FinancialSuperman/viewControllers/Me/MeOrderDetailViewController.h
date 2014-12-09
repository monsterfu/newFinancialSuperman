//
//  MeOrderDetailViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-12-9.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface MeOrderDetailViewController : UIViewController
{
    UITableViewCell* _cell;
    NSArray* _titleArray;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain)orderProductModel* orderProductModel;
@end
