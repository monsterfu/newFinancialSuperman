//
//  MeManageViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-2.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeManageViewController : UIViewController
{
    UITableViewCell* _cell;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end