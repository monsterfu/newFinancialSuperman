//
//  orderProductModel.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface orderProductModel : NSObject

@property(nonatomic, retain)NSString* add_time;
@property(nonatomic, retain)NSString* customer_comment;
@property(nonatomic, retain)NSString* customer_name;
@property(nonatomic, retain)NSString* expected_return;

@property(nonatomic, retain)NSString* order_id;
@property(nonatomic, retain)NSString* order_status;
@property(nonatomic, retain)NSString* order_status_code;
@property(nonatomic, retain)NSString* order_type;
@property(nonatomic, retain)NSString* phone;
@property(nonatomic, retain)NSString* product_id;
@property(nonatomic, retain)NSString* product_name;
@property(nonatomic, retain)NSString* product_price;
@property(nonatomic, retain)NSString* return_commission;
@property(nonatomic, retain)NSString* status_reason;


- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
