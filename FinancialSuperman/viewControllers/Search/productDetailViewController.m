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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --
#pragma mark emailButtonTouched
-(void)emailButtonTouched
{
    
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
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secotionThreeOneIdentifier" forIndexPath:indexPath];
        UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
        titleLabel.text = [_baseInfoTitleArray objectAtIndex:indexPath.row];
        
        
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secotionThreeThreeIdentifier" forIndexPath:indexPath];
    
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


@end
