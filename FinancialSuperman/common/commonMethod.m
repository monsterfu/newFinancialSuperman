//
//  commonMethod.m
//  FinancialSuperman
//
//  Created by Monster on 14-12-6.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "commonMethod.h"

@implementation commonMethod


+ (BOOL) isValidCreditNumber:(NSString*)value {
    BOOL result = NO;
    NSInteger length = [value length];
    if (length >= 13) {
        result = [WTCreditCard isValidNumber:value];
        if (result)
        {
            NSInteger twoDigitBeginValue = [[value substringWithRange:NSMakeRange(0, 2)] integerValue];
            //VISA
            if([WTCreditCard isStartWith:value Str:@"4"]) {
                if (13 == length||16 == length) {
                    result = TRUE;
                }else {
                    result = NO;
                }
            }
            //MasterCard
            else if(twoDigitBeginValue >= 51 && twoDigitBeginValue <= 55 && length == 16) {
                result = TRUE;
            }
            //American Express
            else if(([WTCreditCard isStartWith:value Str:@"34"]||[WTCreditCard isStartWith:value Str:@"37"]) && length == 15){
                result = TRUE;
            }
            //Discover
            else if([WTCreditCard isStartWith:value Str:@"6011"] && length == 16) {
                result = TRUE;
            }else {
                result = FALSE;
            }
        }
        if (result)
        {
            NSInteger digitValue;
            NSInteger checkSum = 0;
            NSInteger index = 0;
            NSInteger leftIndex;
            //even length, odd index
            if (0 == length%2) {
                index = 0;
                leftIndex = 1;
            }
            //odd length, even index
            else {
                index = 1;
                leftIndex = 0;
            }
            while (index < length) {
                digitValue = [[value substringWithRange:NSMakeRange(index, 1)] integerValue];
                digitValue = digitValue*2;
                if (digitValue >= 10)
                {
                    checkSum += digitValue/10 + digitValue%10;
                }
                else
                {
                    checkSum += digitValue;
                }
                digitValue = [[value substringWithRange:NSMakeRange(leftIndex, 1)] integerValue];
                checkSum += digitValue;
                index += 2;
                leftIndex += 2;
            }
            result = (0 == checkSum%10) ? TRUE:FALSE;
        }
    }else {
        result = NO;
    }
    return result;
}
@end
