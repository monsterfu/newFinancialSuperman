//
//  NSString+BankNum.h
//  FinancialSuperman
//
//  Created by Monster on 14-12-5.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BankNum)

-(NSString *)normalNumToBankNum;

-(NSString *)bankNumToNormalNum;
@end
