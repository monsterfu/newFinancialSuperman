//
//  MeAttentionViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-2.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MeAttentionViewController.h"

@interface MeAttentionViewController ()

@end

@implementation MeAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArray = [NSMutableArray array];
    
    if ([USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [self updateUserAttentionProductList];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateUserAttentionProductList) name:NSNotificationCenter_userbeLogin object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateUserAttentionProductList) name:NSNotificationCenter_userFocusProduct object:nil];
    
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
-(void)updateUserAttentionProductList
{
    [self startLoadView:_tableView];
    [HttpRequest attentionRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO],@"list",@""] forKeys:@[@"token",@"action",@"product_id"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_FocusList];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _cell = [tableView dequeueReusableCellWithIdentifier:@"searchProductCellIdentifier" forIndexPath:indexPath];
    _cell.attentionModel = [_dataArray objectAtIndex:indexPath.row];
    _cell.delegate = self;
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [self.navigationController.tabBarController performSegueWithIdentifier:@"searchDetailIdentifier" sender:nil];
}

#pragma mark -- CellDelegate
-(void)searchListCellIsFucus:(UIButton*)sender productid:(NSString *)productid
{
    if (![USERDEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [self.navigationController.tabBarController performSegueWithIdentifier:@"userLoginIdentifier" sender:nil];
    }else{
        _focusButton = sender;
        NSString* focusStr = sender.selected?(@"add"):(@"cancel");
        [HttpRequest attentionRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO],focusStr,productid] forKeys:@[@"token",@"action",@"product_id"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_Focus];
    }
}
#pragma mark -
#pragma mark UIViewControllerLoadViewDelegate
-(void)refreshAction
{
    [self startLoadView:_tableView];
    
    [HttpRequest attentionRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO],@"list",@""] forKeys:@[@"token",@"action",@"product_id"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_FocusList];
}
#pragma mark http result
-(void) GetErr:(ASIHTTPRequest *)request
{
    [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
    if (request.tag == TAG_Product_Focus) {
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
        if (request.tag == TAG_Product_FocusList) {
            if(![[dictionary objectForKey:@"code"] isEqualToString:@"1"])
            {
                [ProgressHUD showError:[dictionary objectForKey:@"message"]];
            }else{
                
                NSMutableArray* productArry = [dictionary objectForKey:@"watchList"];
                for (id dic in productArry) {
                    _attetionModel = [[attentionProductModel alloc]initWithDictionary:dic];
                    [_dataArray addObject:_attetionModel];
                }
                if (_dataArray.count) {
                    [_emptylabel removeFromSuperview];
                    _emptylabel = nil;
                    [self.tableView reloadData];
                }else{
                    if (_emptylabel == nil) {
                        _emptylabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, DEVICE_WIDTH, 40)];
                        _emptylabel.backgroundColor = [UIColor clearColor];
                        _emptylabel.textAlignment = NSTextAlignmentCenter;
                        _emptylabel.text = @"亲，您还没有关注的产品~";
                        _emptylabel.textColor = [UIColor grayColor];
                    }
                    [_tableView addSubview:_emptylabel];
                }
                [self endLoadView];
            }
        }else if (request.tag == TAG_Product_Focus){
            
        }
    }else{
        [ProgressHUD showError:@"数据出错！"];
        if (request.tag == TAG_Product_FocusList) {
            [self mistakeLoadView];
        }
    }
}
@end
