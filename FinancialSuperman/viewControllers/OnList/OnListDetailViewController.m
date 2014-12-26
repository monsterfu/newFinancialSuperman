//
//  OnListDetailViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14/12/20.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "OnListDetailViewController.h"

@interface OnListDetailViewController ()

@end

@implementation OnListDetailViewController

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
    
    UIView* footView = [UIView new];
    [footView setBackgroundColor:[UIColor clearColor]];
    [_tableView setTableFooterView:footView];
    
    UIImage* image = [UIImage imageNamed:@"navi_custom_email_normal"];
    //    image = [image stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    UIBarButtonItem* emailButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(emailButtonTouched)];
    [self.navigationItem setRightBarButtonItem:emailButtonItem];
    
    
    _tableType = EnumTypeTable_jzzs;
    
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _subTableViewController  = [storyBoard instantiateViewControllerWithIdentifier:@"OnListDetailsubTableControllerID"];
    _subTableViewController.productOne = _productOne;
    _subTableViewController.tableEnum = _tableType;
    
    self.title = _productOne.baseInfo.product_name;
    
    [self startLoadView:self.tableView];
    [HttpRequest productSiMuDetailRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_APPKEY_INFO],_productOne.productId] forKeys:@[@"appkey",@"product_id"]]  delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_PrivateTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"orderproductIdentifier"]) {
        _orderViewController = [segue destinationViewController];
        _orderViewController.productOne = _productOne;
    }
}


#pragma mark --
#pragma mark emailButtonTouched
-(void)emailButtonTouched
{
    _emailAlertView = [[UIAlertView alloc]initWithTitle:@"转发到邮箱" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    _emailAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    _emailTextField = [_emailAlertView textFieldAtIndex:0];
    _emailTextField.text = [USER_DEFAULT objectForKey:KEY_EMAIL_ADDRESS_INFO];
    [_emailAlertView show];
}
#pragma mark --
#pragma mark -UIAlertViewDelegate
-(BOOL)CheckInput:(NSString *)_text{
    NSString *Regex=@"[A-Z0-9a-z._%+-]+@[A-Z0-9a-z._]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",Regex];
    return [emailTest evaluateWithObject:_text];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        if (_emailTextField.text.length) {
            if ([self CheckInput:_emailTextField.text]) {
                [ProgressHUD show:@"发送邮件"];
                [HttpRequest emailRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_APPKEY_INFO],_productOne.productId,_emailTextField.text] forKeys:@[@"appkey",@"product_id",@"email"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Email_Product];
                
                [USER_DEFAULT setObject:_emailTextField.text forKey:KEY_EMAIL_ADDRESS_INFO];
                [USER_DEFAULT synchronize];
                
            }else{
                [ProgressHUD showError:@"邮件格式有误!"];
            }
        }
    }
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 180.0f;
    }else{
        switch (_selectedIndex) {
            case EnumTypeTable_jzzs:
            {
                return 390.0f;
            }
                break;
            case EnumTypeTable_rgxz:
            {
                return 390.0f;
            }
                break;
            case EnumTypeTable_xxxx:
            {
                return customCell_height* 11;
            }
                break;
            case EnumTypeTable_fyfl:
            {
                return 390.0f;
            }
                break;
                
            default:
                return 390.0f;
                break;
        }
        return 390.0f;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 1.0f;
    }else{
        return 30.0f;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView* headerView = [UIView new];
        [headerView setBackgroundColor:[UIColor clearColor]];
        return headerView;
    }
    _headerCell = [tableView dequeueReusableCellWithIdentifier:@"siMuCell2HeaderIdentifier"];
    
    [_headerCell.zsButton setBackgroundColor:[UIColor getColor:@"cccccc"]];
    if (_selectedIndex == 0) {
        [_headerCell.zsButton setBackgroundColor:[UIColor whiteColor]];
    }else if (_selectedIndex == 1) {
        [_headerCell.rgButton setBackgroundColor:[UIColor whiteColor]];
    }else if (_selectedIndex == 2) {
        [_headerCell.xxbutton setBackgroundColor:[UIColor whiteColor]];
    }else if (_selectedIndex == 3) {
        [_headerCell.fyButton setBackgroundColor:[UIColor whiteColor]];
    }
    
    
    return _headerCell.contentView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        _cell = [tableView dequeueReusableCellWithIdentifier:@"siMuCellIdentifier"];
        UILabel* dateLabel = (UILabel*)[_cell viewWithTag:1];
        dateLabel.text = _productOne.buy_begin_date;
        UILabel* Labelone = (UILabel*)[_cell viewWithTag:2];
        Labelone.text = _productOne.buy_begin_date;
        UILabel* Labeltwo = (UILabel*)[_cell viewWithTag:3];
        UILabel* Labelthree = (UILabel*)[_cell viewWithTag:4];
        UILabel* Labeldp = (UILabel*)[_cell viewWithTag:5];
        
    }else{
        _cell = [tableView dequeueReusableCellWithIdentifier:@"siMuCell2Identifier"];
        [_cell addSubview:_subTableViewController.view];
    }
    return _cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (![USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
//        [self.navigationController.tabBarController performSegueWithIdentifier:@"userLoginIdentifier" sender:nil];
//    }else{
//        [self.navigationController.tabBarController performSegueWithIdentifier:@"OnlistDetailIdentifier" sender:[_dataArray objectAtIndex:indexPath.row]];
//    }
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
        if (request.tag == TAG_Email_Product) {
            if([[dictionary objectForKey:@"code"] isEqualToString:@"1"])
            {
                [ProgressHUD showSuccess:@"邮件成功!"];
                [USER_DEFAULT setObject:_emailTextField.text forKey:KEY_EMAIL_ADDRESS_INFO];
                [USER_DEFAULT synchronize];
            }else{
                [ProgressHUD showError:[dictionary objectForKey:@"message"]];
            }
        }else if (request.tag == TAG_Product_Detail){
            _productOne = [[ProductOneParamModel alloc]initWithDictionary:[dictionary objectForKey:@"product"]];
            [self endLoadView];
            [_tableView setHidden:NO];
            [_alreadyBookNumLabel setAttributedText:[NSMutableAttributedString instanceupStr:_productOne.booking_count downStr:@"人预约" upColor:COMMON_RED_COLOR downColor:[UIColor blackColor] upFont:[UIFont fontWithName:@"STHeitiSC-Light" size:19] downFont:[UIFont fontWithName:@"STHeitiSC-Light" size:14]]];
        }else if (request.tag == TAG_Product_PrivateTable){
            [self endLoadView];
            [self.tableView reloadData];
        }
    }else{
        [ProgressHUD showError:@"数据出错！"];
        [self endLoadView];
    }
}

#pragma mark - buttonTouch
- (IBAction)zsButtonTouch:(UIButton *)sender {
    if (sender == _selectButton) {
        return;
    }else{
        [_selectButton setBackgroundColor:[UIColor getColor:@"cccccc"]];
        _selectButton = sender;
        [_selectButton setBackgroundColor:[UIColor whiteColor]];
        
        _selectedIndex = 0;
        
        _subTableViewController.tableEnum = EnumTypeTable_jzzs;
        [_subTableViewController.tableView reloadData];
        [_tableView reloadData];
    }
}

- (IBAction)rgButtonTouch:(UIButton *)sender {
    if (sender == _selectButton) {
        return;
    }else{
        [_selectButton setBackgroundColor:[UIColor getColor:@"cccccc"]];
        _selectButton = sender;
        [_selectButton setBackgroundColor:[UIColor whiteColor]];
        
        _selectedIndex = 1;
        
        _subTableViewController.tableEnum = EnumTypeTable_rgxz;
        [_subTableViewController.tableView reloadData];
        [_tableView reloadData];
    }
}

- (IBAction)xxButtonTouch:(UIButton *)sender {
    if (sender == _selectButton) {
        return;
    }else{
        [_selectButton setBackgroundColor:[UIColor getColor:@"cccccc"]];
        _selectButton = sender;
        [_selectButton setBackgroundColor:[UIColor whiteColor]];
        
        _selectedIndex = 2;
        
        _subTableViewController.tableEnum = EnumTypeTable_xxxx;
        [_subTableViewController.tableView reloadData];
        [_tableView reloadData];
        
    }
}

- (IBAction)fyButtonTouch:(UIButton *)sender {
    if (sender == _selectButton) {
        return;
    }else{
        [_selectButton setBackgroundColor:[UIColor getColor:@"cccccc"]];
        _selectButton = sender;
        [_selectButton setBackgroundColor:[UIColor whiteColor]];
        
        _selectedIndex = 3;
        
        _subTableViewController.tableEnum = EnumTypeTable_fyfl;
        [_subTableViewController.tableView reloadData];
        [_tableView reloadData];
    }
}
@end
