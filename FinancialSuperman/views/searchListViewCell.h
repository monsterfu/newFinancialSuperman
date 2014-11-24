//
//  searchListViewCell.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
@class percentRectView;
@class ProductOneParamModel;
@class attentionProductModel;

@protocol searchListViewCell <NSObject>
-(void)searchListCellIsFucus:(UIButton*)button productid:(NSString*)productid;
@end


@interface searchListViewCell : UITableViewCell
{
    
    NSString* _productId;
}

@property (nonatomic, assign)id<searchListViewCell>delegate;
@property (nonatomic, retain)ProductOneParamModel* productOneModel;
@property (nonatomic, retain)attentionProductModel* attentionModel;

@property (weak, nonatomic) IBOutlet UIImageView *statusImage;
@property (weak, nonatomic) IBOutlet UILabel *productLabel;


@property (weak, nonatomic) IBOutlet UIButton *focusButton;
- (IBAction)focusButtonTouched:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *focusLabel;
@property (weak, nonatomic) IBOutlet percentRectView *percentView;
//@property (retain, nonatomic) percentRectView * spercentView;

@property (weak, nonatomic) IBOutlet UILabel *amountLabel;//金额
@property (weak, nonatomic) IBOutlet UILabel *limitLabel;//期限
@property (weak, nonatomic) IBOutlet UILabel *earningsLabel;//收益
@property (weak, nonatomic) IBOutlet UILabel *commissionLabel;//佣金
@property (weak, nonatomic) IBOutlet UILabel *surplusPercentLabel;//剩余额度


@end
