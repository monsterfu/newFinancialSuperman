//
//  MeAttentionViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-2.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"


@protocol MeAttentionViewControllerDelegate <NSObject>
-(void)MeAttentionViewController_CellSelected:(attentionProductModel*)attetionModel;
@end

@interface MeAttentionViewController : baseLoadViewController<searchListViewCell,UIViewControllerLoadViewDelegate>
{
    searchListViewCell* _cell;
    attentionProductModel* _attetionModel;
    
    UIButton* _focusButton;
    UILabel* _emptylabel;
}

@property (nonatomic, assign)id<MeAttentionViewControllerDelegate>delegate;
@property (nonatomic, retain)NSMutableArray* dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
