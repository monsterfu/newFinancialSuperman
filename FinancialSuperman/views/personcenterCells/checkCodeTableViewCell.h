//
//  checkCodeTableViewCell.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-14.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface checkCodeTableViewCell : UITableViewCell
{
    UIButton* checkCodeButton;
    NSUInteger countNum;
    NSTimer* countdownTimer;
}

@property(nonatomic, retain)UITextField* userNameTextField;
@property(nonatomic, retain)NSString* token;
@end
