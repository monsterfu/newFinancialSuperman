//
//  MeAccountViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-2.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface MeAccountViewController : UIViewController
{
    UITableViewCell* _cell;
    UITapGestureRecognizer* _tapGestureRecognizer;
    
    UITextField* _oneTextField;
    UITextField* _twoTextField;
    UITextField* _threeTextField;
}


@end
