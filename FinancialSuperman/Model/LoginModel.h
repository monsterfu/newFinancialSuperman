//
//  LoginModel.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-14.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject

@property(nonatomic, retain)NSString* userName;
@property(nonatomic, retain)NSString* passWord;
@property(nonatomic, retain)NSString* token;


+ (NSMutableDictionary*)stanceWithUserName:(NSString*)userName password:(NSString*)password captcha:(NSString*)captcha;
@end
