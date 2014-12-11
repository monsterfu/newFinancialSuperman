//
//  ProductOneParamModel.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-10.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "ProductOneParamModel.h"


@implementation ProductOneParamModel
@synthesize baseInfo;
@synthesize account_bank;
@synthesize account_id;
@synthesize account_masked_number;
@synthesize account_number;
@synthesize attribute1;
@synthesize attribute2;
@synthesize attribute3;
@synthesize attribute4;
@synthesize booking_count;
@synthesize buy_begin_date;
@synthesize buy_over_date;
@synthesize buy_rate;
@synthesize buy_way;
@synthesize comments;
@synthesize company;
@synthesize cumulative_income;
@synthesize descriptions;
@synthesize display;
@synthesize exit_rate;
@synthesize expected_return_rate;
@synthesize expected_return_ratef;
@synthesize expected_return_oneRate;
@synthesize expected_return_twoRate;
@synthesize expected_return_threeRate;
@synthesize expected_return_fourRate;
@synthesize found_character;
@synthesize foundation_date;
@synthesize fund_cumulative_net;
@synthesize fund_cumulative_net_rate;
@synthesize fund_manager;
@synthesize fund_net;
@synthesize fund_net_unit;
@synthesize product_id;
@synthesize inside_sales;
@synthesize investment_amount;
@synthesize investment_amount1;
@synthesize investment_amount2;
@synthesize investment_amount3;
@synthesize investment_amount4;
@synthesize investment_amount5;
@synthesize investment_amount6;
@synthesize investment_amount7;
@synthesize investment_amount8;
@synthesize investment_cycle;
@synthesize investment_idea;
@synthesize investment_risk;
@synthesize investment_team;
@synthesize is_cash_bill;
@synthesize is_focus;
@synthesize is_structured;
@synthesize last_update_date;
@synthesize management_rate;
@synthesize open_date;
@synthesize organization;
@synthesize popularity;
@synthesize productId;
@synthesize product_type;
@synthesize return_rate;
@synthesize return_rate1;
@synthesize return_rate2;
@synthesize return_rate3;
@synthesize return_rate4;
@synthesize status;
@synthesize stock_broker;
@synthesize total_amount;
@synthesize trusteeship_bank;
@synthesize remainPercent;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        baseInfo = [[BaseInfoModel alloc]init];
        
        NSMutableArray* productArry = [dictionary objectForKey:@"returns"];
        _earnModelArray = [NSMutableArray array];
        for (id dic in productArry) {
            _earnModel = [[earnModel alloc]initWithDictionary:dic];
            [_earnModelArray addObject:_earnModel];
        }
        baseInfo.account_name  = [dictionary objectForKey:@"account_name"];
        baseInfo.complete_percent  = [dictionary objectForKey:@"complete_percent"];
        baseInfo.financiers  = [dictionary objectForKey:@"financiers"];
        baseInfo.fund_size  = [dictionary objectForKey:@"fund_size"];
        baseInfo.guarantor  = [dictionary objectForKey:@"guarantor"];
        baseInfo.guaranty  = [dictionary objectForKey:@"guaranty"];
        baseInfo.investment_category  = [dictionary objectForKey:@"investment_category"];
        baseInfo.investment_orient  = [dictionary objectForKey:@"investment_orient"];
        baseInfo.note  = [dictionary objectForKey:@"note"];
        baseInfo.product_category  = [dictionary objectForKey:@"product_category"];
        baseInfo.issuer  = [dictionary objectForKey:@"issuer"];
        baseInfo.location  = [dictionary objectForKey:@"location"];
        baseInfo.guaranty_percent  = [dictionary objectForKey:@"guaranty_percent"];
        baseInfo.product_name  = [dictionary objectForKey:@"product_name"];
        baseInfo.refund_way  = [dictionary objectForKey:@"refund_way"];
        baseInfo.repayment_source  = [dictionary objectForKey:@"repayment_source"];
        baseInfo.risk_control  = [dictionary objectForKey:@"risk_control"];
        
        
        account_bank = [dictionary objectForKey:@"account_bank"];
        account_id = [dictionary objectForKey:@"account_id"];
        account_masked_number  = [dictionary objectForKey:@"account_masked_number"];
        account_number  = [dictionary objectForKey:@"account_number"];
        attribute1  = [[dictionary objectForKey:@"attribute1"]intValue];
        attribute2  = [[dictionary objectForKey:@"attribute2"]intValue];
        attribute3  = [[dictionary objectForKey:@"attribute3"]intValue];
        attribute4  = [[dictionary objectForKey:@"attribute4"]intValue];
        booking_count  = [dictionary objectForKey:@"booking_count"];
        buy_begin_date  = [dictionary objectForKey:@"buy_begin_date"];
        buy_over_date  = [dictionary objectForKey:@"buy_over_date"];
        buy_rate  = [dictionary objectForKey:@"buy_rate"];
        buy_way  = [dictionary objectForKey:@"buy_way"];
        comments  = [dictionary objectForKey:@"comments"];
        company  = [dictionary objectForKey:@"company"];
        cumulative_income  = [dictionary objectForKey:@"cumulative_income"];
        descriptions  = [dictionary objectForKey:@"description"];
        display  = [[dictionary objectForKey:@"display"]intValue];
        exit_rate  = [dictionary objectForKey:@"exit_rate"];
        expected_return_rate  = [dictionary objectForKey:@"expected_return_rate"];
        expected_return_ratef = [expected_return_rate floatValue];
        expected_return_oneRate  = [dictionary objectForKey:@"expected_return_rate1"];
        expected_return_twoRate  = [dictionary objectForKey:@"expected_return_rate2"];
        expected_return_threeRate  = [dictionary objectForKey:@"expected_return_rate3"];
        expected_return_fourRate  = [dictionary objectForKey:@"expected_return_rate4"];
        NSLog(@"expected_return_rate:%@",expected_return_rate);
        found_character  = [dictionary objectForKey:@"found_character"];
        foundation_date  = [dictionary objectForKey:@"foundation_date"];
        fund_cumulative_net  = [dictionary objectForKey:@"fund_cumulative_net"];
        fund_cumulative_net_rate  = [dictionary objectForKey:@"fund_cumulative_net_rate"];
        fund_manager  = [dictionary objectForKey:@"fund_manager"];
        fund_net  = [dictionary objectForKey:@"fund_net"];
        fund_net_unit  = [dictionary objectForKey:@"fund_net_unit"];
        
        product_id  = [[dictionary objectForKey:@"id"]doubleValue];
        inside_sales  = [dictionary objectForKey:@"inside_sales"];
        investment_amount  = [dictionary objectForKey:@"investment_amount"];
        investment_amount1  = [dictionary objectForKey:@"investment_amount1"];
        investment_amount2  = [dictionary objectForKey:@"investment_amount2"];
        investment_amount3  = [dictionary objectForKey:@"investment_amount3"];
        investment_amount4  = [dictionary objectForKey:@"investment_amount4"];
        investment_amount5  = [dictionary objectForKey:@"investment_amount5"];
        investment_amount6  = [dictionary objectForKey:@"investment_amount6"];
        investment_amount7  = [dictionary objectForKey:@"investment_amount7"];
        investment_amount8  = [dictionary objectForKey:@"investment_amount8"];
        investment_cycle  = [dictionary objectForKey:@"investment_cycle"];
        investment_idea  = [dictionary objectForKey:@"investment_idea"];
        investment_risk  = [dictionary objectForKey:@"investment_risk"];
        investment_team  = [dictionary objectForKey:@"investment_team"];
        is_cash_bill  = [dictionary objectForKey:@"is_cash_bill"];
        is_focus = [dictionary objectForKey:@"is_focus"];
        is_structured  = [dictionary objectForKey:@"is_structured"];
        
        last_update_date  = [dictionary objectForKey:@"last_update_date"];
        
        management_rate  = [dictionary objectForKey:@"management_rate"];
        open_date  = [dictionary objectForKey:@"open_date"];
        organization  = [dictionary objectForKey:@"organization"];
        popularity  = [dictionary objectForKey:@"popularity"];
        productId  = [dictionary objectForKey:@"product_id"];
        product_type  = [dictionary objectForKey:@"product_type"];
        return_rate  = [dictionary objectForKey:@"return_rate"];
        return_rate1  = [dictionary objectForKey:@"return_rate1"];
        return_rate2  = [dictionary objectForKey:@"return_rate2"];
        return_rate3  = [dictionary objectForKey:@"return_rate3"];
        return_rate4  = [dictionary objectForKey:@"return_rate4"];
        status  = [dictionary objectForKey:@"status"];
        stock_broker  = [dictionary objectForKey:@"stock_broker"];
        total_amount  = [dictionary objectForKey:@"total_amount"];
        trusteeship_bank  = [dictionary objectForKey:@"trusteeship_bank"];
        
        float inside_sales_t = [inside_sales floatValue];
        float total_amount_t = [total_amount floatValue];
        if (total_amount_t == 0||inside_sales_t == 0) {
            remainPercent = 0;
        }else if(inside_sales_t >= total_amount_t){
            remainPercent = 1;
        }else{
            remainPercent = inside_sales_t/total_amount_t;
        }
    }
    return self;
    
}

@end
