//
//  OnListDetailViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14/12/20.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"
#import "OnListDetailHeaderCell.h"

@interface OnListDetailViewController : baseLoadViewController<UIAlertViewDelegate>
{
    UITableViewCell* _cell;
    OnListDetailHeaderCell* _headerCell;
    
    UIAlertView* _emailAlertView;
    UITextField* _emailTextField;
    
    UIButton* _selectButton;
}

@property (nonatomic, retain)ProductOneParamModel* productModel;
@property(nonatomic, retain)ProductOneParamModel* productOne;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *alreadyBookNumLabel;


//buttons

- (IBAction)zsButtonTouch:(UIButton *)sender;
- (IBAction)rgButtonTouch:(UIButton *)sender;
- (IBAction)xxButtonTouch:(UIButton *)sender;
- (IBAction)fyButtonTouch:(UIButton *)sender;


@end
