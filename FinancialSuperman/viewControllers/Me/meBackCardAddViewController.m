//
//  meBackCardAddViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-12-5.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "meBackCardAddViewController.h"

@interface meBackCardAddViewController ()

@end

@implementation meBackCardAddViewController


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
    _titleArray = @[@"持卡人", @"卡号", @"银行"];
    
    _isAdd = (_cardModel)?(NO):(YES);
    
    if (_isAdd) {
        self.title = @"添加银行卡";
        _cardModel = [[bankCardModel alloc]init];
        _cardModel.account_name = @" ";
        _cardModel.account_number = @" ";
        _cardModel.account_bank = @" ";
    }else{
        self.title = @"银行卡";
        [_button setTitle:@"解除银行卡" forState:UIControlStateNormal];
        [_button setTitle:@"解除银行卡" forState:UIControlStateHighlighted];
    }
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
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 34;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _cell = [tableView dequeueReusableCellWithIdentifier:@"addCardCellIdentifier" forIndexPath:indexPath];
    _titleLabel = (UILabel*)[_cell viewWithTag:1];
    _titleLabel.text = [_titleArray objectAtIndex:indexPath.row];
    
    if (indexPath.row == 0) {
        _nameTextField = (UITextField*)[_cell viewWithTag:2];
        _nameTextField.keyboardType = UIKeyboardTypeDefault;
        _nameTextField.text = _cardModel.account_name;
        _nameTextField.enabled = _isAdd;
    }else if(indexPath.row == 1){
        _cardTextField = (UITextField*)[_cell viewWithTag:2];
        _cardTextField.keyboardType = UIKeyboardTypeNumberPad;
        _cardTextField.text = _cardModel.account_number;
        _cardTextField.enabled = _isAdd;
    }else if(indexPath.row == 2){
        _bankTextField = (UITextField*)[_cell viewWithTag:2];
        _bankTextField.keyboardType = UIKeyboardTypeDefault;
        _bankTextField.text = _cardModel.account_bank;
        _bankTextField.enabled = _isAdd;
    }
    return _cell;
}

#pragma mark --
#pragma mark -- UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField != _cardTextField) {
        return YES;
    }
    NSString *text = [textField text];
    
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    text = [text stringByReplacingCharactersInRange:range withString:string];
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *newString = @"";
    while (text.length > 0) {
        NSString *subString = [text substringToIndex:MIN(text.length, 4)];
        newString = [newString stringByAppendingString:subString];
        if (subString.length == 4) {
            newString = [newString stringByAppendingString:@" "];
        }
        text = [text substringFromIndex:MIN(text.length, 4)];
    }
    
    newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    
    if (newString.length >= 20) {
        return NO;
    }
    
    [textField setText:newString];
    
    return NO;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}


- (IBAction)buttonTouched:(UIButton *)sender {
    
    _cardModel.account_bank = _bankTextField.text;
    _cardModel.account_name = _nameTextField.text;
    _cardModel.account_number = _cardTextField.text;
    
    NSString* action;
    
    action = _isAdd?(@"add"):(@"cancel");
    
    [HttpRequest bankRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO],action,_cardTextField.text,_nameTextField.text,_bankTextField.text] forKeys:@[@"token",@"action",@"account_number",@"account_name",@"account_bank"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_PersonBankCard];
}

#pragma mark http result
-(void) GetErr:(ASIHTTPRequest *)request
{
    [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
    [self mistakeLoadView];
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
        if(![[dictionary objectForKey:@"code"] isEqualToString:@"1"]){
            [ProgressHUD showError:[dictionary objectForKey:@"message"]];
        }else{
            NSString* notistr = (_isAdd)?(NSNotificationCenter_userBankCardChangedAdd):(NSNotificationCenter_userBankCardChangedRemove);
            [[NSNotificationCenter defaultCenter]postNotificationName:notistr object:_cardModel];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else{
        [ProgressHUD showError:@"数据出错！"];
        [self mistakeLoadView];
    }
}
@end
