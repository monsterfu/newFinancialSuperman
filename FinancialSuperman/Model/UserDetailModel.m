//
//  UserDetailModel.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "UserDetailModel.h"

@implementation UserDetailModel
@synthesize address;
@synthesize city;
@synthesize email;
@synthesize user_id;
@synthesize last_ip;
@synthesize last_login;
@synthesize level;
@synthesize money;
@synthesize nick_name;
@synthesize phone;
@synthesize province;
@synthesize role;
@synthesize total_income;
@synthesize expect_income;
@synthesize returned_count;
@synthesize returning_count;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        address = [dictionary objectForKey:@"address"];
        city = [dictionary objectForKey:@"city"];
        email = [dictionary objectForKey:@"email"];
        user_id  = [[dictionary objectForKey:@"id"]doubleValue];
        last_ip  = [dictionary objectForKey:@"last_ip"];
        last_login  = [dictionary objectForKey:@"last_login"];
        phone  = [dictionary objectForKey:@"phone"];
        level  = [dictionary objectForKey:@"level"];
        money  = [[dictionary objectForKey:@"money"]doubleValue];
        nick_name  = [dictionary objectForKey:@"nick_name"];
        phone  = [dictionary objectForKey:@"phone"];
        province  = [dictionary objectForKey:@"province"];
        role  = [dictionary objectForKey:@"role"];
        total_income  = [dictionary objectForKey:@"total_income"];
        expect_income  = [dictionary objectForKey:@"expect_income"];
        returning_count  = [dictionary objectForKey:@"returning_count"];
        returned_count  = [dictionary objectForKey:@"returned_count"];
    }
    return self;
}

@end
