//
//  attentionProductModel.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-24.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "attentionProductModel.h"

@implementation attentionProductModel


@synthesize complete_percent;         //募集进度
@synthesize expected_return_rate;
@synthesize attention_id;
@synthesize investment_amount;
@synthesize is_cash_bill;
@synthesize product_id;
@synthesize product_name;             //产品名称
@synthesize product_type;
@synthesize return_rate;
@synthesize user_id;
@synthesize investment_cycle;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        complete_percent = [[dictionary objectForKey:@"complete_percent"]floatValue]/100.0f;
        investment_cycle = [dictionary objectForKey:@"investment_cycle"];
        expected_return_rate = [dictionary objectForKey:@"expected_return_rate"];
        attention_id  = [[dictionary objectForKey:@"attention_id"]doubleValue];
        investment_amount  = [dictionary objectForKey:@"investment_amount"];
        is_cash_bill  = [dictionary objectForKey:@"is_cash_bill"];
        product_id  = [dictionary objectForKey:@"product_id"];
        product_name  = [dictionary objectForKey:@"product_name"];
        product_type  = [dictionary objectForKey:@"product_type"];
        return_rate  = [dictionary objectForKey:@"return_rate"];
        user_id  = [dictionary objectForKey:@"user_id"];
    }
    return self;
}

@end
