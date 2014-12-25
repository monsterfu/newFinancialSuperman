//
//  OnListDetailsubTableController.h
//  FinancialSuperman
//
//  Created by Monster on 14/12/25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSTableView.h"
#import "SKSTableViewCell.h"

typedef enum : NSUInteger {
    EnumTypeTable_jzzs,     //净值走势
    EnumTypeTable_rgxz,     //认购须知
    EnumTypeTable_xxxx,     //详细信息
    EnumTypeTable_fyfl,     //返佣费率
} EnumTypeTable_Enum;

@interface OnListDetailsubTableController : UIViewController
{
    NSArray* _rgxzTitleArray;
    NSArray* _xxxxTitleArray;
    
    SKSTableViewCell* _sksCell;
    UITableViewCell* _cell;
    UITableViewCell* _headerCell;
}
@property (weak, nonatomic) IBOutlet SKSTableView *tableView;
@property(nonatomic, assign)EnumTypeTable_Enum tableEnum;


@end
