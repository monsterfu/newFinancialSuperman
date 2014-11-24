//
//  BaseInfoModel.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "BaseInfoModel.h"

@implementation BaseInfoModel

- (id)init
{
    if (self != nil) {
        self.product_name = @"-";
        self.product_category = @"-";      //信托类型
        self.refund_way = @"-";            //收益分配
        self.investment_category = @"-";   //投资行业
        self.fund_size = @"-";             //发行规模
        self.issuer = @"-";                //发行机构
        self.location = @"-";              //发行地区
        self.guaranty = @"-";              //抵押情况
        self.guaranty_percent = @"-";      //抵押率
        self.complete_percent = @"-";      //募集进度
        self.account_name = @"-";          //募集账户
        self.investment_orient = @"-";     //资金投向
        self.repayment_source = @"-";      //还款来源
        self.note = @"-";                  //项目说明
        self.risk_control = @"-";          //风险控制
        self.financiers = @"-";            //担保方介绍
        self.guarantor = @"-";
    }
    return self;
}
@end
