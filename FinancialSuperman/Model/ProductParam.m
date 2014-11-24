//
//  ProductParam.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-10.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "ProductParam.h"

@implementation ProductParam

+ (NSMutableDictionary*)stanceWithKeyword:(NSString*)key product_type:(NSString*)product_type money_amount:(NSString*)amount
                        orgs:(NSString*)orgs sort_by:(NSString*)sort_by is_desc:(NSString*)is_desc
                     charset:(NSString*)charset cur_page:(NSString*)cur_page
{
    return [NSMutableDictionary dictionaryWithObjects:@[@"licai670a083b7b2738d8285b89da2ed82",key,product_type,amount,orgs,sort_by,is_desc,charset,cur_page] forKeys:@[@"appkey",@"key_word",@"product_type",@"money_amount",@"orgs",@"sort_by",@"is_desc",@"charset",@"cur_page"]];
}
@end
