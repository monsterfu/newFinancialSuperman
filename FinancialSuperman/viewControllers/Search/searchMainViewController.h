//
//  searchMainViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface searchMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    searchListViewCell* _cell;
}

@property (nonatomic, retain)NSMutableArray* dataArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;



- (IBAction)segmentedControlTouch:(UISegmentedControl *)sender;

- (IBAction)filterButtonTouched:(UIBarButtonItem *)sender;
@end
