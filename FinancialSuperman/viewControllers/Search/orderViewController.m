//
//  orderViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "orderViewController.h"
#import "GlobalHeader.h"

@interface orderViewController ()

@end

@implementation orderViewController

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
    
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:_tapGestureRecognizer];
    
    self.title = @"立即预约";
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
#pragma --
-(void)tapAction
{
    [_userName resignFirstResponder];
    [_telephoneNum resignFirstResponder];
    [_orderMoney resignFirstResponder];
    [_remarkTextView resignFirstResponder];
}
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
    if (indexPath.row == 3) {
        return 112;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"orderCell%ld",(long)indexPath.row] forIndexPath:indexPath];
    if (indexPath.row == 0) {
        _userName = (UITextField*)[cell viewWithTag:2];
        [_userName becomeFirstResponder];
    }else if (indexPath.row == 1){
        _telephoneNum = (UITextField*)[cell viewWithTag:2];
        _telephoneNum.text = [USER_DEFAULT objectForKey:KEY_USERNAME_INFO];
    }else if (indexPath.row == 2){
        _orderMoney = (UITextField*)[cell viewWithTag:2];
    }else
        _remarkTextView = (UITextView*)[cell viewWithTag:2];
    return cell;
}

- (IBAction)confirmButtonTouch:(UIButton *)sender {
    if (_userName.text.length == 0) {
        [ProgressHUD showError:@"客户名不能为空!"];
        return;
    }
    if (_telephoneNum.text.length < 11) {
        [ProgressHUD showError:@"电话号码不能为空!"];
        return;
    }
    if (_orderMoney.text.length == 0) {
        [ProgressHUD showError:@"预约金额不能为空!"];
        return;
    }
    [ProgressHUD show:@"提交预约中"];
    [HttpRequest orderProductRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO],_productOne.productId,_userName.text,_telephoneNum.text,_orderMoney.text,_remarkTextView.text] forKeys:@[@"token",@"product_id",@"customer_name",@"phone",@"product_price",@"customer_comment"]]delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_Order];
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
        if (request.tag == TAG_Product_Order) {
            if(![[dictionary objectForKey:@"code"] isEqualToString:@"1"])
            {
                [ProgressHUD showError:[dictionary objectForKey:@"message"]];
            }else{
                [ProgressHUD dismiss];
                UIAlertView* succussAlertView = [[UIAlertView alloc]initWithTitle:@"恭喜您!预约提交成功~" message:@"我们将在10分钟内为您审核预约信息，详询电话186-645-987-17" delegate:nil cancelButtonTitle:@"好，知道了" otherButtonTitles:nil, nil];
                [succussAlertView show];
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
    }else{
        [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
    }
}
@end
