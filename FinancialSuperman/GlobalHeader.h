//
//  GlobalHeader.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#ifndef FinancialSuperman_GlobalHeader_h
#define FinancialSuperman_GlobalHeader_h

#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
//cagegory
#import "UIColor+getColor.h"
#import "UIButtonImageOrder+reversal.h"
#import "UIViewController+loadView.h"

#import "UIButtonImageOrder.h"
//customer views
#import "percentRectView.h"
#import "DDProgressView.h"
#import "searchCustomSegmentView.h"

//viewController
#import "LoginViewController.h"
#import "baseInfoTableViewController.h"
#import "orderViewController.h"

//cell about
#import "OnlistViewCell.h"
#import "searchListViewCell.h"

#import "loginTableViewCell.h"
#import "checkCodeTableViewCell.h"
#import "textFieldTableViewCell.h"

//model about
#import "personModel.h"
#import "BaseInfoModel.h"
#import "OnListCellModel.h"
#import "SearchListCellModel.h"
#import "ProductOneParamModel.h"
#import "LoginModel.h"

//thrid-party view control
#import "DKScrollingTabController.h"
//#import "CBStoreHouseRefreshControl.h"
#import "EGORefreshTableHeaderView.h"
#import "ProgressHUD.h"

//http
#import "HttpRequest.h"

//thirdParty
//#import "ProgressHUD.h"

#define Test_Server             @"http://licaichaoren.com:2014/"
#define Formal_Server           @"http://licaichaoren.com/"
#define Test2_Server            @"http://diquehao.com/api/"

#define PRODUCT_API             @"?c=productAPI&m=products_json"
#define LOGIN_API               @"?c=authAPI&m=login"
#define LOGOUT_API              @"?c=authAPI&m=logout"
#define CHECKCODE_API           @"?c=authAPI&m=get_captcha_code"
#define REGISTER_API            @"?c=authAPI&m=register"
#define PASSWORDRESET_API       @"?c=authAPI&m=forgot_password"
#define ATTENTION_API           @"?c=productAPI&m=watchlist_action"  //关注
#define ONLIST_API              @"?c=productAPI&m=products_ranking&appkey=licai670a083b7b2738d8285b89da2ed82"
#define ORDER_API               @"?c=productAPI&m=booking"           //预约产品


#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7 ?YES:NO)
#define DEVICE_WIDTH  [UIScreen mainScreen].bounds.size.width
#define DEVICE_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define APP_BACKGROUND_COLOR  [UIColor colorWithRed:0 green:222/255.0 blue:111/255.0 alpha:1.0]
//缺省保存
#define USERDEFAULT  [NSUserDefaults standardUserDefaults]

//弧度、角度转换
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

//色值

#define BLUE_COLOR   [UIColor getColor:@"4A9DF5"]
#define GREEN_COLOR  [UIColor getColor:@"B0D633"]
#define RED_COLOR    [UIColor getColor:@"F16A9F"]



#define KEY_DEVICE_INFO   @"key_device_info"
#define KEY_DEVICELIST_INFO   @"key_devicelist_info"         //设备列表

//用户信息
#define KEY_CHECKCODE_TOKEN_INFO            @"key_checkcode_token_info"     //验证码TOKEN
#define KEY_TOKEN_INFO                      @"key_token_info"               //用户登录TOKEN
#define KEY_USERNAME_INFO                   @"key_username_info"            //用户信息
#define KEY_PASSWORD_INFO                   @"key_password_info"            //密码
#define KEY_ISLOGIN_INFO                    @"key_islogin_info"             //是否已经登陆
#define KEY_ISLOGIN_WHEN_EXIT_INFO          @"key_islogin_when_exit_info"   //用于记录上次退出时是否是登陆状态方便这次
#define KEY_APPKEY_INFO                     @"key_appkey_info"              //appkey


#define NSNotificationCenter_dismissRecordChange                @"NSNotificationCenter_dismissRecordChange"
#define NSNotificationCenter_userbeLogin                        @"NSNotificationCenter_userbeLogin"
#define NSNotificationCenter_userbeLogout                       @"NSNotificationCenter_userbeLogout"

#define TAG_ProductAll     4001
#define TAG_Product_Focus     4002
#define TAG_Product_Order     4003

#define TAG_PersonCenter_Register    5000
#define TAG_PersonCenter_CheckCode   5001
#define TAG_PersonCenter_Login       5002



#endif
