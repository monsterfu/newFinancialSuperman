//
//  LoginModel.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-14.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel


+ (NSMutableDictionary*)stanceWithUserName:(NSString*)userName password:(NSString*)password captcha:(NSString*)captcha
{
    return [NSMutableDictionary dictionaryWithObjects:@[userName,password,captcha] forKeys:@[@"login",@"password",@"captcha"]];
}
@end
