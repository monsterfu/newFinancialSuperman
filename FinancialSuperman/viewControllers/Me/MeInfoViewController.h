//
//  MeInfoViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-20.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface MeInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITextField* _nickNameTextField;
    UITextField* _telephoneTextField;
    UITextField* _authenticationTextField;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)LogOutButtonTouch:(UIButton *)sender;

@end
