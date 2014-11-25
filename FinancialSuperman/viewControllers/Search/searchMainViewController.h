//
//  searchMainViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface searchMainViewController : baseLoadViewController<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate,EGORefreshTableHeaderDelegate,UIViewControllerLoadViewDelegate,searchListViewCell>
{
    searchListViewCell* _cell;
    UIButtonImageOrder* _searchCustomSegementButton;
    ProductOneParamModel* _productOneModel;
    
    
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    
    UIButton* _focusButton;
    
}

@property (weak, nonatomic) IBOutlet UIView *productTypeView;
@property (weak, nonatomic) IBOutlet searchCustomSegmentView *customSegmentView;
@property(nonatomic,retain)UIImageView *barView;
@property (nonatomic, retain)NSMutableArray* dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)segmentedControlTouch:(UISegmentedControl *)sender;
- (IBAction)filterButtonTouched:(UIBarButtonItem *)sender;


//test
@property (weak, nonatomic) IBOutlet UIButtonImageOrder *amountButton;
@property (weak, nonatomic) IBOutlet UIButtonImageOrder *periodButton;
@property (weak, nonatomic) IBOutlet UIButtonImageOrder *earningButton;
@property (weak, nonatomic) IBOutlet UIButtonImageOrder *commissionButton;

- (IBAction)amountButtonTouched:(UIButtonImageOrder *)sender;
- (IBAction)periodButtonTouched:(UIButtonImageOrder *)sender;
- (IBAction)earningButtonTouched:(UIButtonImageOrder *)sender;
- (IBAction)commissionButtonTouched:(UIButtonImageOrder *)sender;




@end
