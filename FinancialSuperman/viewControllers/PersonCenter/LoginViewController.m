//
//  LoginViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-14.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    if (_usrNameTextfield) {
        _usrNameTextfield.text = [USER_DEFAULT objectForKey:KEY_USERNAME_INFO];
    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登陆";
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:_tapGestureRecognizer];
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

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        _cell = [tableView dequeueReusableCellWithIdentifier:@"userNameCellIdentifier" forIndexPath:indexPath];
        _usrNameTextfield = (UITextField*)[_cell viewWithTag:2];
        _usrNameTextfield.text = [USER_DEFAULT objectForKey:KEY_USERNAME_INFO];
    }else{
        _cell = [tableView dequeueReusableCellWithIdentifier:@"passWordCellIdentifier" forIndexPath:indexPath];
        _paswordTextfield = (UITextField*)[_cell viewWithTag:2];
        _paswordTextfield.text = [USER_DEFAULT objectForKey:KEY_PASSWORD_INFO];
    }
    _cell.textField.tag = indexPath.row;
    _cell.textField.delegate = self;
    _cell.tag = indexPath.row;
    return _cell;
}

- (IBAction)LoginTouch:(UIButton *)sender {
    [self tapAction];
    if (_usrNameTextfield.text.length != 11) {
        [ProgressHUD showError:@"手机号码有误"];
        return;
    }
    if (_paswordTextfield.text.length <=7)
    {
        [ProgressHUD showError:@"密码长度不得少于8位！"];
        return;
    }
    [ProgressHUD show:@"登录中,请稍候..."];
    [HttpRequest userLoginRequest:[LoginModel stanceWithUserName:_usrNameTextfield.text password:_paswordTextfield.text captcha:@""] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_PersonCenter_Login];

}

-(void)tapAction
{
    [_usrNameTextfield resignFirstResponder];
    [_paswordTextfield resignFirstResponder];
}
#pragma mark --
#pragma mark --UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField == _usrNameTextfield)
    {
        if (range.location>10)
        {
            [ProgressHUD showError:@"手机号码只有11位哦!"];
            return  NO;
        }
        else
        {
            return YES;
        }
    }else if(textField == _paswordTextfield){
        
        if(range.location>15){
            [ProgressHUD showError:@"密码输入不能超过15位"];
            return NO;
        }else{
            return YES;
        }
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

#pragma mark http result
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
            [ProgressHUD showSuccess:@"登录成功!"];
            [USER_DEFAULT removeObjectForKey:KEY_TOKEN_INFO];
            [USER_DEFAULT removeObjectForKey:KEY_ISLOGIN_INFO];
            [USER_DEFAULT removeObjectForKey:KEY_PASSWORD_INFO];
            [USER_DEFAULT setObject:[dictionary objectForKey:@"token"] forKey:KEY_TOKEN_INFO];
            [USER_DEFAULT setBool:YES forKey:KEY_ISLOGIN_INFO];
            [USER_DEFAULT setObject:_paswordTextfield.text forKey:KEY_PASSWORD_INFO];
            [USER_DEFAULT synchronize];
            [[NSNotificationCenter defaultCenter]postNotificationName:NSNotificationCenter_userbeLogin object:nil];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [ProgressHUD showError:[dictionary objectForKey:@"message"]];
        }
    }else{
        [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
    }
}

@end
