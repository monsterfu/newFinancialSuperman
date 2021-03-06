//
//  OnlistViewCell.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"


@class ProductOneParamModel;

@protocol OnlistViewCellDelegate <NSObject>

-(void)onlistViewCellIsFucus:(UIButton*)button product:(ProductOneParamModel*)product;

@end

@interface OnlistViewCell : UITableViewCell

@property(nonatomic, assign)id<OnlistViewCellDelegate>delegate;

@property (nonatomic, retain)ProductOneParamModel* productOneModel;

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;//XX万起
@property (weak, nonatomic) IBOutlet UILabel *productTitle;//产品名
@property (weak, nonatomic) IBOutlet UILabel *productPeriod;//产品周期
@property (weak, nonatomic) IBOutlet UILabel *startNum;//xx万起
@property (weak, nonatomic) IBOutlet UILabel *prospectiveEarningsPercent;//预期收益
@property (weak, nonatomic) IBOutlet UILabel *commissionPercent;


@property (weak, nonatomic) IBOutlet UIButton *forcusButton;
@property (weak, nonatomic) IBOutlet UILabel *focusLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

- (IBAction)focusButtonTouch:(UIButton *)sender;
-(void)setproductOneModel:(ProductOneParamModel*)model;

@end
