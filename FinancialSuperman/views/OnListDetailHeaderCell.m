//
//  OnListDetailHeaderCell.m
//  FinancialSuperman
//
//  Created by Monster on 14/12/22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "OnListDetailHeaderCell.h"
#import "UIColor+getColor.h"

@implementation OnListDetailHeaderCell

- (void)awakeFromNib {
    // Initialization code
    
    [_zsButton setBackgroundColor:[UIColor getColor:@"CCCCCC"]];
    [_rgButton setBackgroundColor:[UIColor getColor:@"CCCCCC"]];
    [_xxbutton setBackgroundColor:[UIColor getColor:@"CCCCCC"]];
    [_fyButton setBackgroundColor:[UIColor getColor:@"CCCCCC"]];
    
    _zsButton.selected = YES;
    [_zsButton setBackgroundColor:[UIColor whiteColor]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
