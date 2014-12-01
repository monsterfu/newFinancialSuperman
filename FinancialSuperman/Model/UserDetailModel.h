//
//  UserDetailModel.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDetailModel : NSObject

@property(nonatomic, retain)NSString* address;
@property(nonatomic, retain)NSString* city;
@property(nonatomic, retain)NSString* email;
@property(nonatomic, assign)double user_id;
@property(nonatomic, retain)NSString* last_ip;
@property(nonatomic, retain)NSString* last_login;
@property(nonatomic, retain)NSString* level;
@property(nonatomic, assign)double money;
@property(nonatomic, retain)NSString* nick_name;
@property(nonatomic, retain)NSString* phone;
@property(nonatomic, retain)NSString* province;
@property(nonatomic, retain)NSString* role;
@property(nonatomic, retain)NSString* total_income;     //累计佣金
@property(nonatomic, retain)NSString* expect_income;    //累计佣金
@property(nonatomic, retain)NSString* returned_count;   //累计佣金的订单数
@property(nonatomic, retain)NSString* returning_count;  //预计佣金的订单数


- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
