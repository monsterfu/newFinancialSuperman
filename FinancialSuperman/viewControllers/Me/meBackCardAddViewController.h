//
//  meBackCardAddViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-12-5.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface meBackCardAddViewController : UIViewController<UITextFieldDelegate>
{
    UITableViewCell* _cell;
    NSArray* _titleArray;
    UILabel* _titleLabel;
    UITextField* _nameTextField;
    UITextField* _cardTextField;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
