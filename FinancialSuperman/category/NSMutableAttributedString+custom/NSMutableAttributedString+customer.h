//
//  NSMutableAttributedString+customer.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (customer)

+(NSMutableAttributedString*)instanceupStr:(NSString*)upStr downStr:(NSString*)downStr upColor:(UIColor*)upColor downColor:(UIColor*)downColor upFont:(UIFont*)upFont downFont:(UIFont*)downFont;
@end
