//
//  ProductOneParamModel.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-10.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseInfoModel.h"

@interface ProductOneParamModel : NSObject


@property(nonatomic, retain)BaseInfoModel* baseInfo;


@property(nonatomic, retain)NSString* account_bank;
@property(nonatomic, retain)NSString* account_id;
@property(nonatomic, retain)NSString* account_masked_number;
@property(nonatomic, retain)NSString* account_number;
@property(nonatomic, assign)NSUInteger attribute1;
@property(nonatomic, assign)NSUInteger attribute2;
@property(nonatomic, assign)NSUInteger attribute3;
@property(nonatomic, assign)NSUInteger attribute4;
@property(nonatomic, retain)NSString* booking_count;
@property(nonatomic, retain)NSString* buy_begin_date;
@property(nonatomic, retain)NSString* buy_over_date;
@property(nonatomic, retain)NSString* buy_rate;
@property(nonatomic, retain)NSString* buy_way;
@property(nonatomic, retain)NSString* comments;
@property(nonatomic, retain)NSString* company;
@property(nonatomic, retain)NSString* cumulative_income;
@property(nonatomic, retain)NSString* descriptions;
@property(nonatomic, assign)NSUInteger display;
@property(nonatomic, retain)NSString* exit_rate;
@property(nonatomic, retain)NSString* expected_return_rate;
@property(nonatomic, retain)NSString* expected_return_rate1;
@property(nonatomic, retain)NSString* expected_return_rate2;
@property(nonatomic, retain)NSString* expected_return_rate3;
@property(nonatomic, retain)NSString* expected_return_rate4;
@property(nonatomic, retain)NSString* found_character;
@property(nonatomic, retain)NSString* foundation_date;
@property(nonatomic, retain)NSString* fund_cumulative_net;
@property(nonatomic, retain)NSString* fund_cumulative_net_rate;
@property(nonatomic, retain)NSString* fund_manager;
@property(nonatomic, retain)NSString* fund_net;
@property(nonatomic, retain)NSString* fund_net_unit;
@property(nonatomic, assign)double product_id;
@property(nonatomic, retain)NSString* inside_sales;
@property(nonatomic, retain)NSString* investment_amount;
@property(nonatomic, retain)NSString* investment_amount1;
@property(nonatomic, retain)NSString* investment_amount2;
@property(nonatomic, retain)NSString* investment_amount3;
@property(nonatomic, retain)NSString* investment_amount4;
@property(nonatomic, retain)NSString* investment_amount5;
@property(nonatomic, retain)NSString* investment_amount6;
@property(nonatomic, retain)NSString* investment_amount7;
@property(nonatomic, retain)NSString* investment_amount8;
@property(nonatomic, retain)NSString* investment_cycle;
@property(nonatomic, retain)NSString* investment_idea;
@property(nonatomic, retain)NSString* investment_risk;
@property(nonatomic, retain)NSString* investment_team;
@property(nonatomic, retain)NSString* is_cash_bill;
@property(nonatomic, retain)NSString* is_structured;
@property(nonatomic, retain)NSString* last_update_date;
@property(nonatomic, retain)NSString* management_rate;
@property(nonatomic, retain)NSString* open_date;
@property(nonatomic, retain)NSString* organization;
@property(nonatomic, retain)NSString* popularity;
@property(nonatomic, retain)NSString* productId;
@property(nonatomic, retain)NSString* product_type;
@property(nonatomic, retain)NSString* return_rate;
@property(nonatomic, retain)NSString* return_rate1;
@property(nonatomic, retain)NSString* return_rate2;
@property(nonatomic, retain)NSString* return_rate3;
@property(nonatomic, retain)NSString* return_rate4;
@property(nonatomic, retain)NSString* status;
@property(nonatomic, retain)NSString* stock_broker;
@property(nonatomic, retain)NSString* total_amount;
@property(nonatomic, retain)NSString* trusteeship_bank;
@property(nonatomic, assign)float remainPercent;

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
