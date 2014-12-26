//
//  bemLineViewCell.h
//  FinancialSuperman
//
//  Created by Monster on 14-12-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMSimpleLineGraphView.h"

@interface bemLineViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet BEMSimpleLineGraphView *lineGraphView;
@end
