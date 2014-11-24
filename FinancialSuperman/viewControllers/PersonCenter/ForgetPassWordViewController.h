//
//  ForgetPassWordViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-14.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"
@interface ForgetPassWordViewController : UIViewController<UITextFieldDelegate>
{
    checkCodeTableViewCell* _checkCodeCell;
    textFieldTableViewCell* _textFieldCell;
    
    UITextField* _userNameTextField;
    UITextField* _checkCodeTextField;
    UITextField* _passWordTextField;
    
    UITapGestureRecognizer* _tapGestureRecogizer;
}


- (IBAction)forgetButtonTouch:(UIButton *)sender;

@end
