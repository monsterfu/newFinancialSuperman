//
//  LoginViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-14.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@class loginTableViewCell;

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    UITapGestureRecognizer* _tapGestureRecognizer;
    loginTableViewCell* _cell;
    
    UITextField* _usrNameTextfield;
    UITextField* _paswordTextfield;
    UITextField* _checkCodeTextfield;
    
    NSUInteger _inputNum;               //密码输错次数
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)checkButtonTouch:(UIButton *)sender;


- (IBAction)LoginTouch:(UIButton *)sender;
@end
