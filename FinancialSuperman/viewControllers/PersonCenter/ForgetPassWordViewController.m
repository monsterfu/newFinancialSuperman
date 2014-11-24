//
//  ForgetPassWordViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-14.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "ForgetPassWordViewController.h"

@interface ForgetPassWordViewController ()

@end

@implementation ForgetPassWordViewController
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
    self.title = @"忘记密码";
    
    _tapGestureRecogizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:_tapGestureRecogizer];
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

-(void)tapAction
{
    [_userNameTextField resignFirstResponder];
    [_checkCodeTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
}

#pragma mark --
#pragma mark --UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField == _userNameTextField)
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
    }else if(textField == _passWordTextField){
        
        if(range.location>19){
            [ProgressHUD showError:@"密码输入不能超过20位"];
            return NO;
        }else{
            return YES;
        }
    }else if(textField == _checkCodeTextField){
        
        if(range.location>6){
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

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        _checkCodeCell = [tableView dequeueReusableCellWithIdentifier:@"fUserNameCellIdentifier" forIndexPath:indexPath];
        _checkCodeCell.tag = indexPath.row;
        _userNameTextField = _checkCodeCell.userNameTextField;
        _userNameTextField.delegate =self;
        return _checkCodeCell;
    }else if (indexPath.row == 1) {
        _textFieldCell = [tableView dequeueReusableCellWithIdentifier:@"fCheckCodeCellIdentifier" forIndexPath:indexPath];
        _textFieldCell.tag = indexPath.row;
        _checkCodeTextField = (UITextField*)[_textFieldCell viewWithTag:2];
        _checkCodeTextField.delegate = self;
        return _textFieldCell;
    }else {
        _textFieldCell = [tableView dequeueReusableCellWithIdentifier:@"fPassWordCellIdentifier" forIndexPath:indexPath];
        _passWordTextField = (UITextField*)[_textFieldCell viewWithTag:2];
        _textFieldCell.tag = indexPath.row;
        _passWordTextField.delegate = self;
        
        return _textFieldCell;
    }
    
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
            [ProgressHUD showSuccess:@"重置成功，请登录"];
            [USER_DEFAULT setObject:_userNameTextField.text forKey:KEY_USERNAME_INFO];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [ProgressHUD showError:[dictionary objectForKey:@"message"]];
        }
    }else{
        [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
    }
}

#pragma mark --
#pragma mark -- button touch
- (IBAction)forgetButtonTouch:(UIButton *)sender {
    [self tapAction];
    if (_userNameTextField.text.length != 11)
    {
        [ProgressHUD showError:@"手机号码位数有误!"];
        return;
    }
    if (_passWordTextField.text.length <=7)
    {
        [ProgressHUD showError:@"密码位数不能少于8位!"];
        return;
    }
    if (_checkCodeTextField.text.length != 6)
    {
        [ProgressHUD showError:@"验证码位数有误!"];
        return;
    }
    
    [ProgressHUD show:@"密码重置中，请稍候……"];
    [HttpRequest resetPassWordRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_CHECKCODE_TOKEN_INFO],_userNameTextField.text,_passWordTextField.text,_checkCodeTextField.text] forKeys:@[@"token",@"phone",@"password",@"captcha"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_PersonCenter_Register];
}
@end
