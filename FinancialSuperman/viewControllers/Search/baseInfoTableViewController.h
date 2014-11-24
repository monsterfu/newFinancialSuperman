//
//  baseInfoTableViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@class BaseInfoModel;

@interface baseInfoTableViewController : UITableViewController
{
    NSMutableArray* _cellHeightArray;
    NSMutableArray* _titleArray;
    
    UILabel* _titleLabel;
    UILabel* _contentTextView;
}
@property(nonatomic, retain)BaseInfoModel* baseInfo;
@end
