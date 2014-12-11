//
//  earnModel.m
//  FinancialSuperman
//
//  Created by Monster on 14-12-11.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "earnModel.h"

@implementation earnModel
@synthesize amount1;
@synthesize amount2;
@synthesize amount3;
@synthesize expected_rate;
@synthesize return_rate;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        amount1 = [dictionary objectForKey:@"amount1"];
        amount2 = [dictionary objectForKey:@"amount2"];
        amount3 = [dictionary objectForKey:@"amount3"];
        expected_rate  = [dictionary objectForKey:@"expected_rate"];
        return_rate  = [dictionary objectForKey:@"return_rate"];
    }
    return self;
}
@end
