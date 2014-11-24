//
//  orderViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProductOneParamModel;

@interface orderViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITextField* _userName;
    UITextField* _telephoneNum;
    UITextField* _orderMoney;
    UITextView* _remarkTextView;
    
    UITapGestureRecognizer* _tapGestureRecognizer;
}
@property(nonatomic, retain)ProductOneParamModel* productOne;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)confirmButtonTouch:(UIButton *)sender;

@end
