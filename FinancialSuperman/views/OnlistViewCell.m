//
//  OnlistViewCell.m
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "OnlistViewCell.h"

@implementation OnlistViewCell


-(void)setCellModel:(OnListCellModel*)model
{
    if (model) {
        NSString* imageName = [NSString stringWithFormat:@"cell_bg_%lu",model.startNum/30];
        [self.bgImageView setImage:[UIImage imageNamed:imageName]];
        
        [self]
    }
}
@end
