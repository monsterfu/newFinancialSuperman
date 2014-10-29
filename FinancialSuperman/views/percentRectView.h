//
//  percentRectView.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface percentRectView : UIView

@property(nonatomic, retain)UIColor* bgColor;
@property(nonatomic, assign)CGRect percentRect;

-(void)animationRectWithColor:(UIColor *)color percent:(CGFloat)percent;

@end
