//
//  searchListViewCell.m
//  FinancialSuperman
//
//  Created by Monster on 14-10-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "searchListViewCell.h"
#import "GlobalHeader.h"

@implementation searchListViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.percentView.layer.cornerRadius = 5;
    self.layer.cornerRadius = 5;
}

-(void)setAttentionModel:(attentionProductModel *)attentionModel
{
    _attentionModel  = attentionModel;
    
    _productId = attentionModel.product_id;
    
    [self.focusButton setSelected:YES];
    [self.productLabel setText:_attentionModel.product_name];
    [self.amountLabel setText:[NSString stringWithFormat:@"%@万起",_attentionModel.investment_amount]];
    [self.limitLabel setText:[NSString stringWithFormat:@"%@个月",_attentionModel.investment_cycle]];
    [self.earningsLabel setText:[NSString stringWithFormat:@"%@%%",_attentionModel.expected_return_rate]];
    [self.commissionLabel setText:[NSString stringWithFormat:@"%@%%",_attentionModel.return_rate]];
    [self.surplusPercentLabel setText:[NSString stringWithFormat:@"%.1f%%",_attentionModel.complete_percent*100]];
    [self.percentView animationRectWithColor:[UIColor getColor:@"F89D40"] percent:_attentionModel.complete_percent];
    
    float value = [_productOneModel.expected_return_rate floatValue];
    NSString* imageName = nil;
    if (value < 10) {
        imageName = [NSString stringWithFormat:@"icon_now_1"];
    }else if (value < 30) {
        imageName = [NSString stringWithFormat:@"icon_now_2"];
    }else{
        imageName = [NSString stringWithFormat:@"icon_now_3"];
    }
    
    self.statusImage.image = [UIImage imageNamed:imageName];
}

-(void)setProductOneModel:(ProductOneParamModel *)productOneModel
{
    _productOneModel  = productOneModel;
    
    _productId = productOneModel.productId;
    
    [self.productLabel setText:_productOneModel.baseInfo.product_name];
    [self.amountLabel setText:[NSString stringWithFormat:@"%@万起",_productOneModel.investment_amount]];
    [self.limitLabel setText:[NSString stringWithFormat:@"%@个月",_productOneModel.investment_cycle]];
    [self.earningsLabel setText:[NSString stringWithFormat:@"%@%%",_productOneModel.expected_return_rate]];
    [self.commissionLabel setText:[NSString stringWithFormat:@"%@%%",_productOneModel.return_rate]];
    [self.surplusPercentLabel setText:[NSString stringWithFormat:@"%.1f%%",_productOneModel.remainPercent*100]];
    [self.percentView animationRectWithColor:[UIColor getColor:@"F89D40"] percent:_productOneModel.remainPercent];
    
    float value = [_productOneModel.expected_return_rate floatValue];
    NSString* imageName = nil;
    if (value < 10) {
        imageName = [NSString stringWithFormat:@"icon_now_1"];
    }else if (value < 30) {
        imageName = [NSString stringWithFormat:@"icon_now_2"];
    }else{
        imageName = [NSString stringWithFormat:@"icon_now_3"];
    }
    
    self.statusImage.image = [UIImage imageNamed:imageName];
}

- (IBAction)focusButtonTouched:(UIButton *)sender {
    
    if (![USERDEFAULT boolForKey:KEY_ISLOGIN_INFO])
    {
        if (self.delegate&&[self.delegate respondsToSelector:@selector(searchListCellIsFucus:productid:)]) {
            [self.delegate searchListCellIsFucus:sender productid:_productId];
        }
        return;
    }
    
    sender.selected = (!sender.selected)?(YES):(NO);
    
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k.values = @[@(0.1),@(1.0),@(1.5)];
    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k.calculationMode = kCAAnimationLinear;
    [sender.layer addAnimation:k forKey:@"SHOW"];
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(searchListCellIsFucus:productid:)]) {
        [self.delegate searchListCellIsFucus:sender productid:_productId];
    }
}
@end
