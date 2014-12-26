//
//  privateFundModel.h
//  FinancialSuperman
//
//  Created by Monster on 14/12/27.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface privateFundModel : NSObject

@property(nonatomic, retain)NSString* fund_id;                      //产品名称
@property(nonatomic, retain)NSString* var_day;                      //信托类型
@property(nonatomic, retain)NSString* fund_net_unit;               //收益分配
@property(nonatomic, retain)NSString* fund_cumulative_net;         //投资行业
@property(nonatomic, retain)NSString* fund_day_value;              //发行规模
@property(nonatomic, retain)NSString* fund_day_percent;            //发行机构


- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
