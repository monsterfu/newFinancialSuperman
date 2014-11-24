//
//  BaseInfoModel.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseInfoModel : NSObject

@property(nonatomic, retain)NSString* product_name;             //产品名称
@property(nonatomic, retain)NSString* product_category;         //信托类型
@property(nonatomic, retain)NSString* refund_way;               //收益分配
@property(nonatomic, retain)NSString* investment_category;      //投资行业
@property(nonatomic, retain)NSString* fund_size;                //发行规模
@property(nonatomic, retain)NSString* issuer;                   //发行机构
@property(nonatomic, retain)NSString* location;                 //发行地区
@property(nonatomic, retain)NSString* guaranty;                 //抵押情况
@property(nonatomic, retain)NSString* guaranty_percent;         //抵押率
@property(nonatomic, retain)NSString* complete_percent;         //募集进度
@property(nonatomic, retain)NSString* account_name;             //募集账户
@property(nonatomic, retain)NSString* investment_orient;        //资金投向
@property(nonatomic, retain)NSString* repayment_source;         //还款来源
@property(nonatomic, retain)NSString* note;                     //项目说明
@property(nonatomic, retain)NSString* risk_control;             //风险控制
@property(nonatomic, retain)NSString* financiers;               //担保方介绍
@property(nonatomic, retain)NSString* guarantor;                //融资方介绍
- (id)init;
- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
