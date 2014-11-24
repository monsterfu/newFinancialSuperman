//
//  MeOrderListViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MeOrderListViewController.h"

@interface MeOrderListViewController ()

@end

@implementation MeOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [self updateOrderList];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateOrderList) name:NSNotificationCenter_userbeLogin object:nil];
    
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
-(void)updateOrderList
{
    [self startLoadView:_tableView];
    [HttpRequest orderProductListRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO]] forKeys:@[@"token"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_FocusList];
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
                
//                NSMutableArray* productArry = [dictionary objectForKey:@"watchList"];
//                for (id dic in productArry) {
//                    _attetionModel = [[attentionProductModel alloc]initWithDictionary:dic];
//                    [_dataArray addObject:_attetionModel];
//                }
//                if (_dataArray.count) {
//                    [_emptylabel removeFromSuperview];
//                    _emptylabel = nil;
//                    [self.tableView reloadData];
//                }else{
//                    if (_emptylabel == nil) {
//                        _emptylabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, DEVICE_WIDTH, 40)];
//                        _emptylabel.backgroundColor = [UIColor clearColor];
//                        _emptylabel.textAlignment = NSTextAlignmentCenter;
//                        _emptylabel.text = @"亲，您还没有关注的产品~";
//                        _emptylabel.textColor = [UIColor grayColor];
//                    }
//                    [_tableView addSubview:_emptylabel];
//                }
//                [self endLoadView];
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
