//
//  earnModel.h
//  FinancialSuperman
//
//  Created by Monster on 14-12-11.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface earnModel : NSObject

@property(nonatomic, retain)NSString* amount1;
@property(nonatomic, retain)NSString* amount2;
@property(nonatomic, retain)NSString* amount3;
@property(nonatomic, retain)NSString* expected_rate;
@property(nonatomic, retain)NSString* return_rate;

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
