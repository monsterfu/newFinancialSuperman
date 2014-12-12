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
    
    _cardListArray = [NSMutableArray array];
    
    UIView* _footView = [UIView new];
    [_footView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setTableFooterView:_footView];
    
    if ([USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [self updateUserBankCardList];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateUserBankCardList) name:NSNotificationCenter_userbeLogin object:nil];
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
-(void)updateUserBankCardList
{
    [self startLoadView:_tableView];
    [HttpRequest bankRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO],@"list"] forKeys:@[@"token",@"action"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_PersonBankCard];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_cardListArray count] + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != [_cardListArray count]) {
        return 114;
    }
    return 36;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != [_cardListArray count]) {
        _cell = [tableView dequeueReusableCellWithIdentifier:@"bankCardCellOneIdentifier" forIndexPath:indexPath];
        UILabel* banknameLabel = (UILabel*)[_cell viewWithTag:1];
        UILabel* numLabel = (UILabel*)[_cell viewWithTag:2];
        UILabel* nameLabel = (UILabel*)[_cell viewWithTag:3];
        _bankCardModel = [_cardListArray objectAtIndex:indexPath.row];
        [banknameLabel setText:_bankCardModel.account_bank];
        [numLabel setText:_bankCardModel.account_masked_number];
        [nameLabel setText:_bankCardModel.account_name];
        [banknameLabel setText:_bankCardModel.account_bank];
    }else{
       _cell = [tableView dequeueReusableCellWithIdentifier:@"addBackCardCellIdentifier" forIndexPath:indexPath]; 
    }
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != [_cardListArray count])
    {
        if (self.delegate&&[self.delegate respondsToSelector:@selector(MeManageViewController_AddNewCard)]) {
            [self.delegate MeManageViewController_AddNewCard];
        }
    }else{
        if (self.delegate&&[self.delegate respondsToSelector:@selector(MeManageViewController_ReadCard:)]) {
            [self.delegate MeManageViewController_ReadCard:_bankCardModel = [_cardListArray objectAtIndex:indexPath.row]];
        }
    }
    
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
        if (request.tag == TAG_PersonBankCard) {
            NSMutableArray* productArry = [dictionary objectForKey:@"accounts"];
            [_cardListArray removeAllObjects];
            for (id dic in productArry) {
                _bankCardModel = [[bankCardModel alloc]initWithDictionary:dic];
                [_cardListArray addObject:_bankCardModel];
                [self endLoadView];
                [_tableView reloadData];
            }
        }
    }else{
        [ProgressHUD showError:@"数据出错！"];
        [self mistakeLoadView];
    }
}
@end
