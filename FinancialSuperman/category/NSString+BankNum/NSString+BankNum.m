//
//  NSString+BankNum.m
//  FinancialSuperman
//
//  Created by Monster on 14-12-5.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "NSString+BankNum.h"

@implementation NSString (BankNum)

-(NSString *)normalNumToBankNum
{
    NSString *tmpStr = [self bankNumToNormalNum];
    
    NSUInteger size = (tmpStr.length / 4);
    
    NSMutableArray *tmpStrArr = [[NSMutableArray alloc] init];
    for (int n = 0;n < size; n++)
    {
        [tmpStrArr addObject:[tmpStr substringWithRange:NSMakeRange(n*4, 4)]];
    }
    
    [tmpStrArr addObject:[tmpStr substringWithRange:NSMakeRange(size*4, (tmpStr.length % 4))]];
    
    tmpStr = [tmpStrArr componentsJoinedByString:@" "];
    
    return tmpStr;
}

// 银行卡号转正常号 － 去除4位间的空格
-(NSString *)bankNumToNormalNum
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}
@end
