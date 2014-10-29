//
//  OnlistViewCell.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"


@class OnListCellModel;

@interface OnlistViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet percentRectView *percentView;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;
@property (weak, nonatomic) IBOutlet UIButton *forcusButton;
@property (weak, nonatomic) IBOutlet UILabel *focusLabel;

-(void)setCellModel:(OnListCellModel*)model;

@end
