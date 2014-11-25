//
//  attentionProductModel.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-24.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface attentionProductModel : NSObject


@property(nonatomic, assign)float complete_percent;         //募集进度
@property(nonatomic, retain)NSString* investment_cycle;     //周期
@property(nonatomic, retain)NSString* expected_return_rate;
@property(nonatomic, assign)double attention_id;
@property(nonatomic, retain)NSString* investment_amount;
@property(nonatomic, retain)NSString* is_cash_bill;
@property(nonatomic, retain)NSString* product_id;
@property(nonatomic, retain)NSString* product_name;             //产品名称
@property(nonatomic, retain)NSString* product_type;
@property(nonatomic, retain)NSString* return_rate;
@property(nonatomic, retain)NSString* user_id;


- (id)initWithDictionary:(NSDictionary *)dictionary;


@end
