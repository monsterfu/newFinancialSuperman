//
//  meBackCardAddViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-12-5.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"
#import "bankCardModel.h"

@interface meBackCardAddViewController : baseLoadViewController<UITextFieldDelegate>
{
    UITableViewCell* _cell;
    NSArray* _titleArray;
    UILabel* _titleLabel;
    UITextField* _nameTextField;
    UITextField* _cardTextField;
    UITextField* _bankTextField;
    BOOL _isAdd;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain)bankCardModel* cardModel;

@property (weak, nonatomic) IBOutlet UIButton *button;
- (IBAction)buttonTouched:(UIButton *)sender;

@end
