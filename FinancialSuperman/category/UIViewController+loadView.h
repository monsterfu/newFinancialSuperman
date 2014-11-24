//
//  UIViewController+loadView.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-10.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "loadViewContoller.h"



@interface UIViewController (loadView)<UIViewControllerLoadViewDelegate>

-(void)startLoadView:(UIView*)view;
-(void)endLoadView;
-(void)mistakeLoadView;

@end
