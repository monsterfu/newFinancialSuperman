//
//  HttpRequest.h
//  IVMall (Ipad)
//
//  Created by sean on 14-2-24.
//  Copyright (c) 2014年 HYQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "ProductParam.h"

@interface HttpRequest : NSObject



+(void)Request:(NSString*)url postdate:(NSMutableDictionary*)postdata tag:(NSUInteger)tag delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel;

+(void)fetchProductRequest:(NSMutableDictionary*)productParamDetail delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;



//用户登陆
+(void)userLoginRequest:(NSMutableDictionary*)userLoginDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;

//用户退出登
+(void)userLogOutRequest:(NSMutableDictionary*)userLoginDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;

//用户注册
+(void)userRegisterRequest:(NSMutableDictionary*)userRegisterDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;

//获取验证码
+(void)fetchCheckCodeRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;

//密码重置
+(void)resetPassWordRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;

//关注、取消关注、获取用户关注列表
+(void)attentionRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;

//预约产品
+(void)orderProductRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;

//获取预约产品列表
+(void)orderProductListRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;

//获取用户明细
+(void)personDetailRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;

//将产品发邮件给客户
+(void)emailRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;

//银行卡相关操作
+(void)bankRequest:(NSMutableDictionary*)infoDic delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel tag:(NSUInteger)tag;
@end
























