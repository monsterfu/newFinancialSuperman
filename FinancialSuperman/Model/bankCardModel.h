//
//  bankCardModel.h
//  FinancialSuperman
//
//  Created by Monster on 14-12-12.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface bankCardModel : NSObject

@property(nonatomic, retain)NSString* account_bank;
@property(nonatomic, retain)NSString* account_masked_number;
@property(nonatomic, retain)NSString* account_name;
@property(nonatomic, retain)NSString* account_number;
@property(nonatomic, retain)NSString* descriptions;
@property(nonatomic, retain)NSString* status;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
