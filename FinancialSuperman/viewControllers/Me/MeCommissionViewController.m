//
//  MeCommissionViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-2.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MeCommissionViewController.h"

@interface MeCommissionViewController ()

@end

@implementation MeCommissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [self updateUserDetail];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateUserDetail) name:NSNotificationCenter_userbeLogin object:nil];
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

#pragma mark - NotificationCenter_userbeLogin
-(void)updateUserDetail
{
    [self startLoadView:_tableView];
    [HttpRequest personDetailRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO]] forKeys:@[@"token"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_PersonDetail];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        _cell = [tableView dequeueReusableCellWithIdentifier:@"commissionDetailCellIdentifier" forIndexPath:indexPath];
    }
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [self.navigationController.tabBarController performSegueWithIdentifier:@"searchDetailIdentifier" sender:nil];
}

#pragma mark -
#pragma mark UIViewControllerLoadViewDelegate
-(void)refreshAction
{
    [self startLoadView:_tableView];
    [HttpRequest personDetailRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO]] forKeys:@[@"token"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_PersonDetail];
}

#pragma mark http result
-(void) GetErr:(ASIHTTPRequest *)request
{
    [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
    if (request.tag == TAG_Product_OrderList) {
        [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
        [self mistakeLoadView];
    }
}
-(void) GetResult:(ASIHTTPRequest *)request
{
    NSData *responseData = [request responseData];
    NSString*pageSource = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"pageSource:%@",pageSource);
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    NSLog(@"dic is %@",dictionary);
    if(dictionary!=nil){
        if (request.tag == TAG_PersonDetail) {
            if(![[dictionary objectForKey:@"code"] isEqualToString:@"1"])
            {
                [ProgressHUD showError:[dictionary objectForKey:@"message"]];
            }else{
                NSMutableDictionary* dic = [dictionary objectForKey:@"user"];
                _model = [[UserDetailModel alloc]initWithDictionary:dic];
                [self endLoadView];
            }
        }else if (request.tag == TAG_Product_Focus){
            
        }
    }else{
        [ProgressHUD showError:@"数据出错！"];
        if (request.tag == TAG_Product_OrderList) {
            [self mistakeLoadView];
        }
    }
}
@end
