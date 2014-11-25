//
//  orderProductModel.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "orderProductModel.h"

@implementation orderProductModel

@synthesize add_time;
@synthesize customer_comment;
@synthesize customer_name;
@synthesize expected_return;

@synthesize order_id;
@synthesize order_status;
@synthesize order_status_code;
@synthesize order_type;
@synthesize phone;
@synthesize product_id;
@synthesize product_name;
@synthesize product_price;
@synthesize return_commission;
@synthesize status_reason;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        add_time = [dictionary objectForKey:@"add_time"];
        customer_comment = [dictionary objectForKey:@"customer_comment"];
        customer_name = [dictionary objectForKey:@"customer_name"];
        expected_return  = [dictionary objectForKey:@"expected_return"];
        order_id  = [dictionary objectForKey:@"order_id"];
        order_status  = [dictionary objectForKey:@"order_status"];
        order_status_code  = [dictionary objectForKey:@"order_status_code"];
        order_type  = [dictionary objectForKey:@"order_type"];
        phone  = [dictionary objectForKey:@"phone"];
        product_id  = [dictionary objectForKey:@"product_id"];
        product_name  = [dictionary objectForKey:@"product_name"];
        product_price  = [dictionary objectForKey:@"product_price"];
        return_commission  = [dictionary objectForKey:@"return_commission"];
        status_reason  = [dictionary objectForKey:@"status_reason"];
    }
    return self;
}

@end
