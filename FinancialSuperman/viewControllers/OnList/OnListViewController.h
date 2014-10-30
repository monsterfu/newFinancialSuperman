//
//  OnListViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface OnListViewController : UITableViewController
{
    OnlistViewCell* _cell;
}

@property(nonatomic, retain)NSMutableArray* modelArray;


- (IBAction)phoneButtonTouched:(UIBarButtonItem *)sender;

@end
