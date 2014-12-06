//
//  MeMainViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-1.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"
#import "MeCommissionViewController.h"
#import "MeManageViewController.h"
#import "MeOrderListViewController.h"
#import "MeAttentionViewController.h"
#import "RemindLoginViewController.h"

@interface MeMainViewController : UIViewController<UIScrollViewDelegate, RemindLoginDelage,MeManageViewControllerDelegate>
{
    DKScrollingTabController *leftTabController;
    
    MeCommissionViewController* _meCommissionViewController;
    MeManageViewController* _meManageViewController;
    MeOrderListViewController* _meOrderListViewController;
    MeAttentionViewController* _meAttentionViewController;
    
    RemindLoginViewController* _remindLoginViewController;
    
    NSArray* _controllerArry;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *personButtonItem;

- (IBAction)personButtonTouched:(UIBarButtonItem *)sender;

@end
