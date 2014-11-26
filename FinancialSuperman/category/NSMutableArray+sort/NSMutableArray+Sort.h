//
//  NSMutableArray+Sort.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Sort)
-(NSMutableArray*)sortwithkey:(NSString*)key ascending:(BOOL)ascending;
@end
