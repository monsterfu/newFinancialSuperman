//
//  MeManageViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-2.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@protocol MeManageViewControllerDelegate <NSObject>
-(void)MeManageViewController_AddNewCard;
-(void)MeManageViewController_ReadCard:(bankCardModel*)cardModel;
@end

@interface MeManageViewController : baseLoadViewController<UIViewControllerLoadViewDelegate>
{
    UITableViewCell* _cell;
    NSMutableArray* _cardListArray;
    bankCardModel* _bankCardModel;
}

@property (nonatomic, assign)id<MeManageViewControllerDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
