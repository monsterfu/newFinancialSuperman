//
//  ProductParam.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-10.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

//产品类型
static NSString* Producttype_bank = @"bank";//银行理财
static NSString* Producttype_P2P = @"P2P";
static NSString* Producttype_fund = @"fund";//基金
static NSString* Producttype_partner = @"partner";//有限合伙
static NSString* Producttype_trust = @"trust";//信托
static NSString* Producttype_asset = @"asset";//资管
static NSString* Producttype_private_fund = @"private_fund";//私募

//排序条件
static NSString* Sortcondition_return_rate = @"return_rate";  //佣金费率
static NSString* Sortcondition_investment_cycle = @"investment_cycle";  //期限
static NSString* Sortcondition_expected_return_rate = @"expected_return_rate";  //收益
static NSString* Sortcondition_open_date = @"open_date";  //开放日

@interface ProductParam : NSObject


@property(nonatomic, retain)NSString* appkey;  //必填，安全码防止恶意访问  licai670a083b7b2738d8285b89da2ed82
@property(nonatomic, retain)NSString* key_word; // 字符 关键字，用于全文搜索
@property(nonatomic, retain)NSString* product_type; //当为空的时候，代表全部产品
@property(nonatomic, retain)NSString* money_amount; //可能的值，任意整数，单位万元，无需带单位 查找起购金额<=money_amount的产品
@property(nonatomic, retain)NSString* orgs;  //可以查找多个代销机构的产品，按英文逗号分割， 例如 :"招商银行,兴业银行"
@property(nonatomic, retain)NSString* sort_by;  //排序条件
@property(nonatomic, retain)NSString* is_desc; //可能的值1，0，默认是1，排序规则 1代表降序，0代表升序
@property(nonatomic, retain)NSString* charset;  //可选  保留字段 目前暂无意义
@property(nonatomic, retain)NSString* cur_page;  //当前页数

+ (NSMutableDictionary*)stanceWithKeyword:(NSString*)key product_type:(NSString*)product_type money_amount:(NSString*)amount
                        orgs:(NSString*)orgs sort_by:(NSString*)sort_by is_desc:(NSString*)is_desc
                     charset:(NSString*)charset cur_page:(NSString*)cur_page;

@end
