//
//  MeOrderListViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface MeOrderListViewController : UIViewController

@property(nonatomic, retain)NSMutableArray* dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
