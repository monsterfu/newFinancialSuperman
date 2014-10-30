//
//  GlobalHeader.h
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#ifndef FinancialSuperman_GlobalHeader_h
#define FinancialSuperman_GlobalHeader_h


#import "UIColor+getColor.h"
#import "percentRectView.h"

//cell about
#import "OnlistViewCell.h"
#import "searchListViewCell.h"

//model about
#import "OnListCellModel.h"
#import "SearchListCellModel.h"



#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7 ?YES:NO)
#define DEVICE_WIDTH  [UIScreen mainScreen].bounds.size.width
#define DEVICE_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define APP_BACKGROUND_COLOR  [UIColor colorWithRed:0 green:222/255.0 blue:111/255.0 alpha:1.0]

//弧度、角度转换
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

//色值

#define BLUE_COLOR   [UIColor getColor:@"4A9DF5"]
#define GREEN_COLOR  [UIColor getColor:@"B0D633"]
#define RED_COLOR    [UIColor getColor:@"F16A9F"]


#define KEY_DEVICE_INFO   @"key_device_info"
#define KEY_DEVICELIST_INFO   @"key_devicelist_info"         //设备列表


#define NSNotificationCenter_dismissRecordChange            @"NSNotificationCenter_dismissRecordChange"

#endif
