//
//  productDetailViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"


@interface productDetailViewController : UIViewController
{
    NSMutableArray* _headerTitleArray;
    NSMutableArray* _baseInfoTitleArray;
    
    baseInfoTableViewController* _baseInfoViewController;
    orderViewController* _orderViewController;
}

@property(nonatomic, retain)ProductOneParamModel* productOne;

@end
