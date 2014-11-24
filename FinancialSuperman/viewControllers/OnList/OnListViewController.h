//
//  OnListViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface OnListViewController : UITableViewController<EGORefreshTableHeaderDelegate,EGORefreshTableHeaderDelegate,UIViewControllerLoadViewDelegate,OnlistViewCellDelegate>
{
    OnlistViewCell* _cell;
    ProductOneParamModel* _productOneModel;
    UIButton* _focusButton;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
}
@property(nonatomic,retain)UIImageView *barView;
@property (nonatomic, retain)NSMutableArray* dataArray;

- (IBAction)phoneButtonTouched:(UIBarButtonItem *)sender;

@end
