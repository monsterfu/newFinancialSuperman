//
//  commonMethod.h
//  FinancialSuperman
//
//  Created by Monster on 14-12-6.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface commonMethod : NSObject

//判断是否为有效的银行卡号
+ (BOOL) isValidCreditNumber:(NSString*)value;
@end
