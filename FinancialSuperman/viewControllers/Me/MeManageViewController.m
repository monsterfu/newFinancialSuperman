//
//  MeManageViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-2.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MeManageViewController.h"

@interface MeManageViewController ()

@end

@implementation MeManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView* _footView = [UIView new];
    [_footView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setTableFooterView:_footView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        _cell = [tableView dequeueReusableCellWithIdentifier:@"manageTotalCellIdentifier" forIndexPath:indexPath];
    }else{
       _cell = [tableView dequeueReusableCellWithIdentifier:@"manageOtherCellIdentifier" forIndexPath:indexPath]; 
    }
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.navigationController.tabBarController performSegueWithIdentifier:@"searchDetailIdentifier" sender:nil];
}
@end
