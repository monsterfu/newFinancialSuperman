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
@property(nonatomic, assign)float earningsPercent;  //收益率    eg: 9%
@property(nonatomic, assign)BOOL isFocus;   //是否关注


- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
