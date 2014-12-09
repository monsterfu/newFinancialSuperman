//
//  productDetailViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-10-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "productDetailViewController.h"

@interface productDetailViewController ()

@end

@implementation productDetailViewController
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
    
    _headerTitleArray = [NSMutableArray arrayWithObjects:@"收益说明",@"收益计算",@"基本信息",@"官方点评", nil];
    
    _baseInfoTitleArray = [NSMutableArray arrayWithObjects:@"发行规模",@"产品限期",@"投资行业",@"项目所属",@"发行机构",@"发行日期",@"募集进度",@"说明", nil];
    
    self.title = _productOne.baseInfo.product_name;
    UIImage* image = [UIImage imageNamed:@"navi_custom_email_normal"];
//    image = [image stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    UIBarButtonItem* emailButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(emailButtonTouched)];
    [self.navigationItem setRightBarButtonItem:emailButtonItem];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    [backItem setBackButtonBackgroundImage:[UIImage imageNamed:@"navi_custom_back_btn_normal.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefaultPrompt];
    self.navigationItem.backBarButtonItem = backItem;
    backItem.title = @" ";
    if (_productOne == nil && _attentionOne) {
        self.title = _attentionOne.product_name;        
        [_tableView setHidden:YES];
        [self startLoadView:self.view];
        [HttpRequest productOneDetailRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_APPKEY_INFO],_attentionOne.product_id] forKeys:@[@"appkey",@"product_id"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_Detail];
    }else{
        
        [_alreadyBookNumLabel setAttributedText:[NSMutableAttributedString instanceupStr:_productOne.booking_count downStr:@"人预约" upColor:COMMON_RED_COLOR downColor:[UIColor blackColor] upFont:[UIFont fontWithName:@"STHeitiSC-Light" size:19] downFont:[UIFont fontWithName:@"STHeitiSC-Light" size:14]]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    
    [_textField resignFirstResponder];
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
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return 4;
    }else if(section == 1){
        return 3;
    }else if(section == 2){
        return 8;
    }else
        return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secotionOneOneIdentifier" forIndexPath:indexPath];
            return cell;
        }else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secotionOneTwoIdentifier" forIndexPath:indexPath];
            return cell;
        }
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secotionTwoOneIdentifier" forIndexPath:indexPath];
            return cell;
        }else if (indexPath.row == 1) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secotionTwoTwoIdentifier" forIndexPath:indexPath];
            return cell;
        }else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secotionTwoThreeIdentifier" forIndexPath:indexPath];
            return cell;
        }
        
    }else if(indexPath.section == 2){
        UITableViewCell *cell;
        if (indexPath.row == 0) {
            //发行规模（万元）
            cell = [tableView dequeueReusableCellWithIdentifier:@"secotionThreeOneIdentifier" forIndexPath:indexPath];
            UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
            titleLabel.text = [_baseInfoTitleArray objectAtIndex:indexPath.row];
            UILabel* contentLabel = (UILabel*)[cell viewWithTag:2];
            [contentLabel setAttributedText:[NSMutableAttributedString instanceupStr:_productOne.baseInfo.fund_size downStr:@"万元" upColor:[UIColor grayColor] downColor:[UIColor grayColor] upFont:[UIFont systemFontOfSize:14.0f] downFont:[UIFont systemFontOfSize:14.0f]]];
        }else if (indexPath.row == 1) {
            //产品限期 buy_over_date
            cell = [tableView dequeueReusableCellWithIdentifier:@"secotionThreeOneIdentifier" forIndexPath:indexPath];
            UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
            titleLabel.text = [_baseInfoTitleArray objectAtIndex:indexPath.row];
            UILabel* contentLabel = (UILabel*)[cell viewWithTag:2];
            [contentLabel setAttributedText:[NSMutableAttributedString instanceupStr:_productOne.buy_over_date downStr:@" " upColor:[UIColor grayColor] downColor:[UIColor grayColor] upFont:[UIFont systemFontOfSize:14.0f] downFont:[UIFont systemFontOfSize:14.0f]]];
        }else if (indexPath.row == 2) {
            //投资行业 investment_category
            cell = [tableView dequeueReusableCellWithIdentifier:@"secotionThreeOneIdentifier" forIndexPath:indexPath];
            UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
            titleLabel.text = [_baseInfoTitleArray objectAtIndex:indexPath.row];
            UILabel* contentLabel = (UILabel*)[cell viewWithTag:2];
            [contentLabel setAttributedText:[NSMutableAttributedString instanceupStr:_productOne.baseInfo.investment_category downStr:@" " upColor:[UIColor grayColor] downColor:[UIColor grayColor] upFont:[UIFont systemFontOfSize:14.0f] downFont:[UIFont systemFontOfSize:14.0f]]];
        }else if (indexPath.row == 3) {
            //项目所属 location
            cell = [tableView dequeueReusableCellWithIdentifier:@"secotionThreeOneIdentifier" forIndexPath:indexPath];
            UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
            titleLabel.text = [_baseInfoTitleArray objectAtIndex:indexPath.row];
            UILabel* contentLabel = (UILabel*)[cell viewWithTag:2];
            [contentLabel setAttributedText:[NSMutableAttributedString instanceupStr:_productOne.baseInfo.location downStr:@" " upColor:[UIColor grayColor] downColor:[UIColor grayColor] upFont:[UIFont systemFontOfSize:14.0f] downFont:[UIFont systemFontOfSize:14.0f]]];
        }else if (indexPath.row == 4) {
            //发行机构 issuer
            cell = [tableView dequeueReusableCellWithIdentifier:@"secotionThreeOneIdentifier" forIndexPath:indexPath];
            UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
            titleLabel.text = [_baseInfoTitleArray objectAtIndex:indexPath.row];
            UILabel* contentLabel = (UILabel*)[cell viewWithTag:2];
            [contentLabel setAttributedText:[NSMutableAttributedString instanceupStr:_productOne.baseInfo.issuer downStr:@" " upColor:[UIColor grayColor] downColor:[UIColor grayColor] upFont:[UIFont systemFontOfSize:14.0f] downFont:[UIFont systemFontOfSize:14.0f]]];
        }else if (indexPath.row == 5) {
            //发行日期 buy_begin_date
            cell = [tableView dequeueReusableCellWithIdentifier:@"secotionThreeOneIdentifier" forIndexPath:indexPath];
            UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
            titleLabel.text = [_baseInfoTitleArray objectAtIndex:indexPath.row];
            UILabel* contentLabel = (UILabel*)[cell viewWithTag:2];
            [contentLabel setAttributedText:[NSMutableAttributedString instanceupStr:_productOne.buy_begin_date downStr:@" " upColor:[UIColor grayColor] downColor:[UIColor grayColor] upFont:[UIFont systemFontOfSize:14.0f] downFont:[UIFont systemFontOfSize:14.0f]]];
        }else if (indexPath.row == 6) {
            //募集进度
            cell = [tableView dequeueReusableCellWithIdentifier:@"secotionThreeTwoIdentifier" forIndexPath:indexPath];
            UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
            titleLabel.text = [_baseInfoTitleArray objectAtIndex:indexPath.row];
            UILabel* contentLabel = (UILabel*)[cell viewWithTag:3];
            [contentLabel setAttributedText:[NSMutableAttributedString instanceupStr:_productOne.baseInfo.complete_percent downStr:@" " upColor:[UIColor grayColor] downColor:[UIColor grayColor] upFont:[UIFont systemFontOfSize:14.0f] downFont:[UIFont systemFontOfSize:14.0f]]];
            percentRectView* _percentView = (percentRectView*)[cell viewWithTag:2];
            [_percentView animationRectWithColor:[UIColor getColor:@"F89D40"] percent:0.4];
        }else{
            //说明
            cell = [tableView dequeueReusableCellWithIdentifier:@"secotionThreeThreeIdentifier" forIndexPath:indexPath];
            UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
            titleLabel.text = _productOne.descriptions;
        }
        
        
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secotionFourThreeIdentifier" forIndexPath:indexPath];
        UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
        titleLabel.text = _productOne.comments;
        return cell;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_headerTitleArray objectAtIndex:section];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self performSegueWithIdentifier:@"pushIdentifier" sender:nil];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 38)];
        UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, DEVICE_WIDTH/3, 38)];
        label.text = @"基本信息";
        label.font = [UIFont boldSystemFontOfSize:14];
        [view addSubview:label];
        
        UIImageView* detailImageView = [[UIImageView alloc]initWithFrame:CGRectMake(DEVICE_WIDTH - 20 - 10, 10, 20, 20)];
        [detailImageView setImage:[UIImage imageNamed:@"icon_in"]];
        [view addSubview:detailImageView];
        [view setBackgroundColor:[UIColor getColor:@"EBEBEB"]];
        
        UITapGestureRecognizer* _headerTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(detailTouched)];
        [view addGestureRecognizer:_headerTap];
        return view;
    }
    return nil;
}
-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 38;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 3) {
        return 65;
    }
    return 44;
}
#pragma - HeaderView DetailButtonTouch
-(void)detailTouched
{
    [self performSegueWithIdentifier:@"baseInfoIdentifier" sender:nil];
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     if ([segue.identifier isEqualToString:@"baseInfoIdentifier"]) {
         _baseInfoViewController = [segue destinationViewController];
         _baseInfoViewController.baseInfo = _productOne.baseInfo;
     }else if ([segue.identifier isEqualToString:@"orderproductIdentifier"]) {
         _orderViewController = [segue destinationViewController];
         _orderViewController.productOne = _productOne;
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
        }
    }else{
        [ProgressHUD showError:@"数据出错！"];
    }
}

@end
