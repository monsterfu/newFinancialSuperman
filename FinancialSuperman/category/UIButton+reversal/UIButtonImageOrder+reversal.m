//
//  UIButton+reversal.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-1.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "UIButtonImageOrder+reversal.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation UIButtonImageOrder (reversal)
-(BOOL)reversal
{
    if (self.normalOrder) {
        self.imageView.transform=CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0));
        self.normalOrder = NO;
        
    }else{
        self.imageView.transform=CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0.0));
        self.normalOrder = YES;
    }
    return self.normalOrder;
}
@end
