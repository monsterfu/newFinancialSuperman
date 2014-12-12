//
//  bankCardModel.m
//  FinancialSuperman
//
//  Created by Monster on 14-12-12.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "bankCardModel.h"

@implementation bankCardModel

@synthesize account_bank;
@synthesize account_masked_number;
@synthesize account_name;
@synthesize account_number;
@synthesize descriptions;
@synthesize status;


- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        account_bank = [dictionary objectForKey:@"account_bank"];
        account_masked_number = [dictionary objectForKey:@"account_masked_number"];
        account_name = [dictionary objectForKey:@"account_name"];
        account_number  = [dictionary objectForKey:@"account_number"];
        descriptions  = [dictionary objectForKey:@"descriptions"];
        status  = [dictionary objectForKey:@"status"];
    }
    return self;
}
@end
