//
//  MeManageViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-2.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface MeManageViewController : baseLoadViewController<UIViewControllerLoadViewDelegate>
{
    UITableViewCell* _cell;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
