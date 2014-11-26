//
//  percentRectView.m
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "percentRectView.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+getcolor.h"

@implementation percentRectView

-(void)animationRectWithColor:(UIColor *)color percent:(CGFloat)percent
{
    process = percent;
    if (process > 1) {
        process = 1.0;
    }
    
    [self setNeedsDisplay];
    
}

-(void)drawRect:(CGRect)rect
{
    self.backgroundColor = [UIColor getColor:@"F1F1F1"];
    if (processView == nil) {
        processView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, process*self.frame.size.width, rect.size.height)];
        processView.backgroundColor = [UIColor getColor:@"F89D40"];
        [self addSubview:processView];
    }
    processView.layer.cornerRadius = 5;
    
    processView.frame = CGRectMake(processView.frame.origin.x,processView.frame.origin.y, 0*self.frame.size.width, processView.frame.size.height);;
    [UIView animateWithDuration:2.0f animations:^{
        
        _percentRect = CGRectMake(processView.frame.origin.x,processView.frame.origin.y, process*self.frame.size.width, processView.frame.size.height);
        processView.frame = _percentRect;
    }];
}
@end
