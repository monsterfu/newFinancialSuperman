//
//  RegisterViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-14.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface RegisterViewController : UIViewController<UITextFieldDelegate>
{
    checkCodeTableViewCell* _checkCodeCell;
    textFieldTableViewCell* _textFieldCell;
    BOOL isAgreedPropotol;
    
    NSString* _token;
    
    UITextField* _userNameTextField;
    UITextField* _checkCodeTextField;
    UITextField* _passWordTextField;
    UITextField* _serviceNoTextField;
    
    UITapGestureRecognizer* _tapGestureRecogizer;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)agreeButtonTouch:(UIButton *)sender;
- (IBAction)propotolButtonTouch:(UIButton *)sender;
- (IBAction)registerButtonTouch:(UIButton *)sender;


@end
