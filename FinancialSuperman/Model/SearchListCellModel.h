//
//  SearchListCellModel.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OnListCellModel.h"

@interface SearchListCellModel : NSObject
@property(nonatomic, retain)OnListCellModel* productModel;
@property(nonatomic, assign)float restMon;

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
