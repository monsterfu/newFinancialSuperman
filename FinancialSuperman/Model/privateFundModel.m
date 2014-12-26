//
//  privateFundModel.m
//  FinancialSuperman
//
//  Created by Monster on 14/12/27.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "privateFundModel.h"

@implementation privateFundModel

@synthesize     fund_id;
@synthesize     var_day;
@synthesize     fund_net_unit;
@synthesize     fund_cumulative_net;
@synthesize     fund_day_value;
@synthesize     fund_day_percent;



- (id)init
{
    if (self != nil) {
        self.fund_id = @"-";
        self.var_day = @"-";      //信托类型
        self.fund_net_unit = @"-";            //收益分配
        self.fund_cumulative_net = @"-";   //投资行业
        self.fund_day_value = @"-";             //发行规模
        self.fund_day_percent = @"-";                //发行机构
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if ([dictionary count] == 0) {
        return [self init];
    }
    if (self = [super init])
    {
        fund_id = [dictionary objectForKey:@"fund_id"];
        var_day = [dictionary objectForKey:@"var_day"];
        fund_net_unit = [dictionary objectForKey:@"fund_net_unit"];
        fund_cumulative_net  = [dictionary objectForKey:@"fund_cumulative_net"];
        fund_day_value  = [dictionary objectForKey:@"fund_day_value"];
        fund_day_percent  = [dictionary objectForKey:@"fund_day_percent"];
    }
    return self;
}

@end
