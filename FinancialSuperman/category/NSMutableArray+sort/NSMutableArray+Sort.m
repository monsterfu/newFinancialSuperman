//
//  NSMutableArray+Sort.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "NSMutableArray+Sort.h"

@implementation NSMutableArray (Sort)

-(NSMutableArray*)sortwithkey:(NSString*)key ascending:(BOOL)ascending
{
    NSSortDescriptor *SortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:ascending];
    NSArray* midArray = [self copy];
    NSArray *arr3 = [midArray sortedArrayUsingDescriptors:[NSArray arrayWithObjects:SortDescriptor, nil]];
    
    return [NSMutableArray arrayWithArray:arr3];
}

@end
