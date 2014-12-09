//
//  HttpRequest.m
//  IVMall (Ipad)
//
//  Created by sean on 14-2-24.
//  Copyright (c) 2014年 HYQ. All rights reserved.
//

#import "HttpRequest.h"
#import "GlobalHeader.h"
#import "AppDelegate.h"


@implementation HttpRequest
+(void)Request:(NSString*)url postdate:(NSMutableDictionary*)postdataDic tag:(NSUInteger)tag delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel{
    
    NSLog(@"url is %@",url);
    NSURL *httpurl = [NSURL URLWithString:url];
    
    ASIFormDataRequest* asiRequest = [ASIFormDataRequest requestWithURL:httpurl];
    
    [asiRequest setTag:tag];
    
    [asiRequest setRequestMethod:@"POST"];
    for (NSString* key in postdataDic) {
        [asiRequest setPostValue:[postdataDic objectForKey:key] forKey:key];
    }
    [asiRequest setUseSessionPersistence:NO];
    [asiRequest setUseCookiePersistence:NO];
    [asiRequest setDefaultResponseEncoding:NSUTF8StringEncoding];
    [asiRequest setDelegate:delegate];
    [asiRequest setTimeOutSeconds:10.0f];
    [asiRequest setDidFinishSelector:finishSel];
    [asiRequest setDidFailSelector:failSel];
    [asiRequest startAsynchronous];
    
}

//获取产品信息接口

+(void)fetchProductRequest:(NSMutableDictionary*)productParamDetail delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server, PRODUCT_API] postdate:productParamDetail tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//用户登陆
+(void)userLoginRequest:(NSMutableDictionary*)userLoginDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server, LOGIN_API] postdate:userLoginDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//用户退出登
+(void)userLogOutRequest:(NSMutableDictionary*)userLoginDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag
{
   [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server, LOGOUT_API] postdate:userLoginDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//用户注册
+(void)userRegisterRequest:(NSMutableDictionary*)userRegisterDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server, REGISTER_API] postdate:userRegisterDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//获取验证码
+(void)fetchCheckCodeRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server,CHECKCODE_API] postdate:infoDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//密码重置
+(void)resetPassWordRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server,PASSWORDRESET_API] postdate:infoDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//关注
+(void)attentionRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server,ATTENTION_API] postdate:infoDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//预约产品
+(void)orderProductRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server,ORDER_API] postdate:infoDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//获取预约产品列表
+(void)orderProductListRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server,ORDER_LIST_API] postdate:infoDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//获取用户明细
+(void)personDetailRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server,USER_DETAIL_API] postdate:infoDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//将产品发邮件给客户
+(void)emailRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server,EMAIL_API] postdate:infoDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//银行卡相关操作
+(void)bankRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server,BANK_API] postdate:infoDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}

//获取某产品详细信息
+(void)productOneDetailRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag{
    [self Request:[NSString stringWithFormat:@"%@%@",Test2_Server,PRODUCT_DETAIL_API] postdate:infoDic tag:tag delegate:delegate finishSel:finishSel failSel:failSel];
}
@end









