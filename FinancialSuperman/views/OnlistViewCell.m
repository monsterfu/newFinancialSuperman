//
//  OnlistViewCell.m
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "OnlistViewCell.h"

@implementation OnlistViewCell


- (IBAction)focusButtonTouch:(UIButton *)sender {
    
    if (![USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO])
    {
        if (self.delegate&&[self.delegate respondsToSelector:@selector(onlistViewCellIsFucus:product:)]) {
            [self.delegate onlistViewCellIsFucus:sender product:_productOneModel];
        }
        return;
    }
    
    sender.selected = (!sender.selected)?(YES):(NO);
    
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k.values = @[@(0.1),@(1.0),@(1.5)];
    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k.calculationMode = kCAAnimationLinear;
    [sender.layer addAnimation:k forKey:@"SHOW"];
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(onlistViewCellIsFucus:product:)]) {
        [self.delegate onlistViewCellIsFucus:sender product:_productOneModel];
    }
    
}

-(void)setproductOneModel:(ProductOneParamModel*)model
{
    if (model) {
        _productOneModel = model;
        
        [self.productTitle setText:model.baseInfo.product_name];
        [self.numLabel setText:[NSString stringWithFormat:@"%@",model.investment_amount]];
        [self.startNum setText:[NSString stringWithFormat:@"%@",model.investment_amount]];
        [self.productPeriod setText:[NSString stringWithFormat:@"%@",model.investment_cycle]];
        [self.prospectiveEarningsPercent setText:[NSString stringWithFormat:@"%@%%",model.expected_return_rate]];
        [self.commissionPercent setText:[NSString stringWithFormat:@"%@%%",model.return_rate]];
        [self.detailLabel setText:[NSString stringWithFormat:@"%@",model.comments]];
        
        float value = [model.expected_return_rate floatValue];
        NSString* imageName = nil;
        if (value < 10) {
            imageName = [NSString stringWithFormat:@"cell_bg_1"];
        }else if (value < 30) {
            imageName = [NSString stringWithFormat:@"cell_bg_2"];
        }else{
            imageName = [NSString stringWithFormat:@"cell_bg_3"];
        }
        
        self.bgImageView.image = [UIImage imageNamed:imageName];
    }
}
@end
