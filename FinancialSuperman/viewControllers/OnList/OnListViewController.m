//
//  OnListViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "OnListViewController.h"


#define popularity   @"popularity"

@implementation OnListViewController

-(void)viewDidDisappear:(BOOL)animated
{
    _barView.hidden = YES;
}
-(void)viewDidLoad
{
    _dataArray = [NSMutableArray array];
    
    [self startLoadView:self.tableView];
    
    [HttpRequest fetchProductRequest:[ProductParam stanceWithKeyword:@"" product_type:@"" money_amount:@"1000" orgs:@"" sort_by:@"" is_desc:@"1" charset:@"" cur_page:@"1"] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_ProductAll];
    
    if (_refreshHeaderView == nil) {
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
        view.delegate = self;
        [self.tableView addSubview:view];
        _refreshHeaderView = view;
    }
    
    if (_barView == nil) {
        UIImage *img = [[UIImage imageNamed:@"timeline_new_status_background.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        _barView = [[UIImageView alloc] initWithImage:img];
        _barView.frame = CGRectMake(5, -120, DEVICE_WIDTH-10, 40);
        [self.tableView addSubview:_barView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.tag = 100;
        label.font = [UIFont systemFontOfSize:16.0f];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        [_barView addSubview:label];
        [_barView setHidden:YES];
    }
}
#pragma mark -
#pragma mark UIViewControllerLoadViewDelegate
-(void)refreshAction
{
    [self startLoadView:self.tableView];
    
    [HttpRequest fetchProductRequest:[ProductParam stanceWithKeyword:@"" product_type:@"" money_amount:@"1000" orgs:@"" sort_by:@"" is_desc:@"1" charset:@"" cur_page:@"1"] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_ProductAll];
}
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
    [HttpRequest fetchProductRequest:[ProductParam stanceWithKeyword:@"" product_type:@"" money_amount:@"1000" orgs:@"" sort_by:@"" is_desc:@"1" charset:@"" cur_page:@"1"] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_ProductAll];
    _reloading = YES;
}

- (void)doneLoadingTableViewData{
    
    UILabel *label = (UILabel *)[_barView viewWithTag:100];
    label.text = [NSString stringWithFormat:@"%lu个产品更新",(unsigned long)_dataArray.count];
    [label sizeToFit];
    CGRect frame = label.frame;
    frame.origin = CGPointMake((_barView.frame.size.width - frame.size.width)/2, (_barView.frame.size.height - frame.size.height)/2);
    label.frame = frame;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _barView.hidden = NO;
        [UIView animateWithDuration:0.6 animations:^{
            CGRect frame = _barView.frame;
            frame.origin.y = 5;
            _barView.frame = frame;
        } completion:^(BOOL finished){
            if (finished) {
                [UIView animateWithDuration:0.6 delay:1.0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
                    CGRect frame = _barView.frame;
                    frame.origin.y = -120;
                    _barView.frame = frame;
                } completion:^(BOOL finished){
                    _barView.hidden = YES;
                }];
            }
        }];
    });
//    [self performSelector:@selector(updateUI) withObject:nil afterDelay:0.1];
    
    _reloading = NO;
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    
}

#pragma mark EGORefreshTableHeaderDelegate Methods
//下拉到一定距离，手指放开时调用
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    
    [self reloadTableViewDataSource];
    
    //停止加载，弹回下拉
    //[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:2.0];
}

- (void)updateUI {
    
    _barView.hidden = NO;
    [UIView animateWithDuration:0.6 animations:^{
        CGRect frame = _barView.frame;
        frame.origin.y = 5;
        _barView.frame = frame;
    } completion:^(BOOL finished){
        if (finished) {
            [UIView animateWithDuration:0.6 delay:1.0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
                CGRect frame = _barView.frame;
                frame.origin.y = -120;
                _barView.frame = frame;
            } completion:^(BOOL finished){
                _barView.hidden = YES;
            }];
        }
    }];
    
}
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    return _reloading; // should return if data source model is reloading
    
}

//取得下拉刷新的时间
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    
    return [NSDate date]; // should return date data source was last changed
    
}
#pragma mark -- CellDelegate
-(void)onlistViewCellIsFucus:(UIButton*)button product:(ProductOneParamModel*)product
{
    if (![USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [self.navigationController.tabBarController performSegueWithIdentifier:@"userLoginIdentifier" sender:nil];
    }else{
        _focusButton = button;
        NSString* focusStr = button.selected?(@"add"):(@"cancel");
        [HttpRequest attentionRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO],focusStr,product.productId] forKeys:@[@"token",@"action",@"product_id"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_Focus];
    }
}
#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _cell = [tableView dequeueReusableCellWithIdentifier:@"onListViewCellIndentifier" forIndexPath:indexPath];
    _cell.delegate = self;
    [_cell setproductOneModel:[_dataArray objectAtIndex:indexPath.row]];
    return _cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [self.navigationController.tabBarController performSegueWithIdentifier:@"userLoginIdentifier" sender:nil];
    }else{
        [self.navigationController.tabBarController performSegueWithIdentifier:@"OnlistDetailIdentifier" sender:[_dataArray objectAtIndex:indexPath.row]];
    }
}

//
- (IBAction)phoneButtonTouched:(UIBarButtonItem *)sender {
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"呼叫经理人 " message:@"18664598717" delegate:self cancelButtonTitle:@"不了" otherButtonTitles:@"呼叫", nil];
    [alertView show];
}

#pragma mark  - UIAlertDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://18664598717"]];
    }
}

#pragma mark http result
-(void) GetErr:(ASIHTTPRequest *)request
{
    [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
    if (request.tag == TAG_Product_Focus) {
        _focusButton.selected = (!_focusButton.selected)?(YES):(NO);
    }else if (request.tag == TAG_ProductAll)
    {
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
        if (request.tag == TAG_Product_Focus) {
            if(![[dictionary objectForKey:@"code"] isEqualToString:@"1"])
            {
                _focusButton.selected = (!_focusButton.selected)?(YES):(NO);
                [ProgressHUD showError:[dictionary objectForKey:@"message"]];
            }else{
                [[NSNotificationCenter defaultCenter]postNotificationName:NSNotificationCenter_userFocusProduct object:nil];
            }
        }else if (request.tag == TAG_ProductAll){
            [self endLoadView];
            
            [_dataArray removeAllObjects];
            
            NSMutableArray* productArry = [dictionary objectForKey:@"products"];
            for (id dic in productArry) {
                _productOneModel = [[ProductOneParamModel alloc]initWithDictionary:dic];
                [_dataArray addObject:_productOneModel];
            }
            [self.tableView reloadData];
            [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
            [self doneLoadingTableViewData];
        }
        
    }else{
        [ProgressHUD showError:@"数据出错！"];
        if (request.tag == TAG_Product_Focus) {
            _focusButton.selected = (!_focusButton.selected)?(YES):(NO);
        }else if (request.tag == TAG_ProductAll)
        {
            [self mistakeLoadView];
        }
    }
}
@end
