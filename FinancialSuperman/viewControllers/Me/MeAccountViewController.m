//
//  MeAccountViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-2.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MeAccountViewController.h"

@interface MeAccountViewController ()

@end

@implementation MeAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:_tapGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tapAction
{
    [_threeTextField resignFirstResponder];
    [_oneTextField resignFirstResponder];
    [_twoTextField resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        _cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"meAccount%ldCellIdentifier",indexPath.row+1] forIndexPath:indexPath];
    }
    if (indexPath.row == 0) {
        _oneTextField = (UITextField*)[_cell viewWithTag:2];
    }else if (indexPath.row == 1) {
        _twoTextField = (UITextField*)[_cell viewWithTag:2];
    }else if (indexPath.row == 2) {
        _threeTextField = (UITextField*)[_cell viewWithTag:2];
    }
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [self.navigationController.tabBarController performSegueWithIdentifier:@"searchDetailIdentifier" sender:nil];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel* headerView = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, DEVICE_WIDTH-40, 60)];
    headerView.backgroundColor = [UIColor clearColor];
    headerView.numberOfLines = 2;
    headerView.textColor = [UIColor grayColor];
    headerView.text = @"只需填写以下三个信息，即可生成专属于您的个人资产配置模型";
    headerView.font = [UIFont systemFontOfSize:16];
    headerView.textAlignment = NSTextAlignmentCenter;
    return headerView;
}
@end
