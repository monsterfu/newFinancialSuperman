//
//  NSMutableAttributedString+customer.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "NSMutableAttributedString+customer.h"

@implementation NSMutableAttributedString (customer)

+(NSMutableAttributedString*)instanceupStr:(NSString*)upStr downStr:(NSString*)downStr upColor:(UIColor*)upColor downColor:(UIColor*)downColor upFont:(UIFont*)upFont downFont:(UIFont*)downFont
{
    if ([upStr isEqualToString:@""]) {
        upStr = @"-";
    }
    NSRange investment_amount = NSMakeRange(0, upStr.length);
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",upStr,downStr]];
    [str addAttribute:NSForegroundColorAttributeName value:upColor range:investment_amount];
    [str addAttribute:NSForegroundColorAttributeName value:downColor range:NSMakeRange(upStr.length,downStr.length)];
    [str addAttribute:NSFontAttributeName value:upFont range:investment_amount];
    [str addAttribute:NSFontAttributeName value:downFont range:NSMakeRange(investment_amount.length,downStr.length)];
    return str;
}
@end
