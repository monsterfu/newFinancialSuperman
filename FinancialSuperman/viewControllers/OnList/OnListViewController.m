//
//  OnListViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "OnListViewController.h"

@implementation OnListViewController


-(void)viewDidLoad
{
    _modelArray = [NSMutableArray array];
    
    for (NSInteger index = 0; index < 4; index++) {
        OnListCellModel* model = [[OnListCellModel alloc]init];
        model.startNum = 30*index;
        model.earningsPercent = 0.19*index;
        model.isFocus = ((index+1)%2 == 0)?(YES):(NO);
        [_modelArray addObject:model];
    }
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _cell = [tableView dequeueReusableCellWithIdentifier:@"onListViewCellIndentifier" forIndexPath:indexPath];
    _cell
}
@end
