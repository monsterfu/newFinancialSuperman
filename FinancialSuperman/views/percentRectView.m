//
//  percentRectView.m
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "percentRectView.h"

@implementation percentRectView

-(void)animationRectWithColor:(UIColor *)color percent:(CGFloat)percent
{
    _percentRect = CGRectMake(0, 0, self.frame.size.width*percent, self.frame.size.height);
    _bgColor = color;
    
}
-(void)drawRect:(CGRect)rect
{
    [_bgColor set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithRect:_percentRect];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath fill];
    
}
@end
