//
//  baseLoadViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "loadViewContoller.h"


@interface baseLoadViewController : UIViewController
{
    loadViewContoller* _loadViewController;
}

-(void)startLoadView;
-(void)endLoadView;
-(void)mistakeLoadView;

@end
