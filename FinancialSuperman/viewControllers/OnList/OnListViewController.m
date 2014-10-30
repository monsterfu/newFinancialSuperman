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
    
    for (NSInteger index = 1; index < 5; index++) {
        OnListCellModel* model = [[OnListCellModel alloc]init];
        model.startNum = 30*index;
//        model.prospectiveEarningsPercent = 0.19*index;
        model.isFocus = ((index+1)%2 == 0)?(YES):(NO);
        [_modelArray addObject:model];
    }
    
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _cell = [tableView dequeueReusableCellWithIdentifier:@"onListViewCellIndentifier" forIndexPath:indexPath];
    [_cell setCellModel:[_modelArray objectAtIndex:indexPath.row]];
    return _cell;
}
//
- (IBAction)phoneButtonTouched:(UIBarButtonItem *)sender {
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"呼叫经理人 " message:@"18664598717" delegate:self cancelButtonTitle:@"不了" otherButtonTitles:@"呼叫", nil];
    [alertView show];
}

#pragma mark  - UIAlertDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://18664598717"]];
    }
}
@end
