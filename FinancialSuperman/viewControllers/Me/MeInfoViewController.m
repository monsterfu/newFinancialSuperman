//
//  MeInfoViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-20.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MeInfoViewController.h"

@interface MeInfoViewController ()

@end

@implementation MeInfoViewController


-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人信息";
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 59;
    }
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"meInfoCell%ld",(long)indexPath.row] forIndexPath:indexPath];
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1){
        _nickNameTextField = (UITextField*)[cell viewWithTag:2];
        _nickNameTextField.text = [USER_DEFAULT objectForKey:KEY_USERNAME_INFO];
    }else if (indexPath.row == 2){
        _telephoneTextField = (UITextField*)[cell viewWithTag:2];
        _telephoneTextField.text = [USER_DEFAULT objectForKey:KEY_USERNAME_INFO];
    }else
        _authenticationTextField = (UITextField*)[cell viewWithTag:2];
    return cell;
}

#pragma mark ---

- (IBAction)LogOutButtonTouch:(UIButton *)sender {
    [HttpRequest userLogOutRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO]] forKeys:@[@"token"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_PersonCenter_CheckCode];
}

-(void) GetErr:(ASIHTTPRequest *)request
{
    [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
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
        if([[dictionary objectForKey:@"code"] isEqualToString:@"1"])
        {
            [ProgressHUD showSuccess:@"退出登录"];
            [USER_DEFAULT setBool:NO forKey:KEY_ISLOGIN_INFO];
            [self.navigationController popViewControllerAnimated:YES];
            [[NSNotificationCenter defaultCenter]postNotificationName:NSNotificationCenter_userbeLogout object:nil];
        }else{
            [ProgressHUD showError:[dictionary objectForKey:@"message"]];
        }
    }else{
        [ProgressHUD showError:@"数据出错！"];
    }
}
@end
