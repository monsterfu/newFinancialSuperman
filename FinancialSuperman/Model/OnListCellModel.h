//
//  OnListCellModel.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OnListCellModel : NSObject

@property(nonatomic, assign)NSUInteger startNum;  //起始金额  eg: XX万起
@property(nonatomic, retain)NSString* productTitle; //产品名
@property(nonatomic, retain)NSString* productPeriod;//产品周期
@property(nonatomic, assign)float prospectiveEarningsPercent;  //收益率    eg: 9%
@property(nonatomic, assign)float commissionPercent;  //收益率    eg: 9%
@property(nonatomic, assign)BOOL isFocus;   //是否关注
@property(nonatomic, retain)NSString* productDetail; //产品点评

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
