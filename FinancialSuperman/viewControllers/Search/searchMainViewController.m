//
//  searchMainViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-10-30.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "searchMainViewController.h"
#import "productDetailViewController.h"

@interface searchMainViewController ()

@end

@implementation searchMainViewController
-(void)viewDidDisappear:(BOOL)animated
{
    _barView.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    _dataArray = [NSMutableArray array];
    _allProductArray = [NSMutableArray array];
    _xinTuoProductArray = [NSMutableArray array];
    _ziguanProductArray = [NSMutableArray array];
    _simuProductArray = [NSMutableArray array];
    
    _searchCustomSegementButton = _amountButton;
    _amountButton.normalOrder = YES;
    _periodButton.normalOrder = YES;
    _earningButton.normalOrder = YES;
    _commissionButton.normalOrder = YES;
    _selectProductType = ProductTypeEnumValue_All;
    
    [self startLoadView:_tableView];
    
    [HttpRequest fetchProductRequest:[ProductParam stanceWithKeyword:@"" product_type:@"" money_amount:@"1000" orgs:@"" sort_by:@"" is_desc:@"1" charset:@"" cur_page:@"1"] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_ProductAll];
    
    if (_refreshHeaderView == nil) {
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - _tableView.bounds.size.height, self.view.frame.size.width, _tableView.bounds.size.height)];
        view.delegate = self;
        [_tableView addSubview:view];
        _refreshHeaderView = view;
    }
    
    if (_barView == nil) {
        UIImage *img = [[UIImage imageNamed:@"timeline_new_status_background.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        _barView = [[UIImageView alloc] initWithImage:img];
        _barView.frame = CGRectMake(5, -30, DEVICE_WIDTH-10, 40);
        [self.tableView addSubview:_barView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.tag = 100;
        label.font = [UIFont systemFontOfSize:16.0f];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        [_barView addSubview:label];
        [_barView setHidden:YES];
    }
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshAction) name:NSNotificationCenter_userbeLogin object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if ([segue.identifier isEqualToString:@"searchDetailIdentifier"])
//    {
//        ProductOneParamModel* _product = (ProductOneParamModel*)sender;
//        productDetailViewController *vc = (productDetailViewController *) segue.destinationViewController;
//        [vc setProductOne:_product];
//    }
}


#pragma mark -
#pragma mark UIViewControllerLoadViewDelegate
-(void)refreshAction
{
    [self startLoadView:_tableView];
    
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
    
    
    [self performSelector:@selector(updateUI) withObject:nil afterDelay:0.1];
    
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
}

- (void)updateUI {
    _barView.hidden = NO;
    [UIView animateWithDuration:0.6 animations:^{
        CGRect frame = _barView.frame;
        frame.origin.y = 10;
        _barView.frame = frame;
    } completion:^(BOOL finished){
        if (finished) {
            [UIView animateWithDuration:0.6 delay:1.0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
                CGRect frame = _barView.frame;
                frame.origin.y = -30;
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
    _productOneModel = [_dataArray objectAtIndex:indexPath.row];
    _cell.productOneModel = _productOneModel;
    
    _cell.delegate = self;
    return _cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [self.navigationController.tabBarController performSegueWithIdentifier:@"userLoginIdentifier" sender:nil];
    }else{
        [self.navigationController.tabBarController performSegueWithIdentifier:@"searchDetailIdentifier" sender:[_dataArray objectAtIndex:indexPath.row]];
    }
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -- CellDelegate
-(void)searchListCellIsFucus:(UIButton*)sender productid:(NSString *)productid
{
    if (![USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [self.navigationController.tabBarController performSegueWithIdentifier:@"userLoginIdentifier" sender:nil];
    }else{
        _focusButton = sender;
        NSString* focusStr = sender.selected?(@"add"):(@"cancel");
        [HttpRequest attentionRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_TOKEN_INFO],focusStr,productid] forKeys:@[@"token",@"action",@"product_id"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_Product_Focus];
    }
}
#pragma mark - sort


#pragma mark - touch
- (IBAction)segmentedControlTouch:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        _dataArray = _allProductArray;
    }else if (sender.selectedSegmentIndex == 1) {
        _dataArray = _xinTuoProductArray;
    }else if (sender.selectedSegmentIndex == 2) {
        _dataArray = _ziguanProductArray;
    }else{
        _dataArray = _simuProductArray;
    }
    _selectProductType = sender.selectedSegmentIndex;
    [_tableView reloadData];
}

- (IBAction)filterButtonTouched:(UIBarButtonItem *)sender {
}


//
- (IBAction)amountButtonTouched:(UIButtonImageOrder *)sender {
    BOOL ascending = YES;
    if (_searchCustomSegementButton != sender) {
        if (sender.selected == NO) {
            sender.selected = YES;
            [_searchCustomSegementButton setSelected:NO];
            [_searchCustomSegementButton reversal];
            _searchCustomSegementButton = sender;
        }
    }else{
        ascending = [sender reversal];
    }
    NSMutableArray* _sortArray = _dataArray;
    _dataArray = [_sortArray sortwithkey:@"investment_amount" ascending:ascending];
    [self.tableView scrollsToTop];
    [self.tableView reloadData];
}

- (IBAction)periodButtonTouched:(UIButtonImageOrder *)sender {
    BOOL ascending = YES;
    if (_searchCustomSegementButton != sender) {
        if (sender.selected == NO) {
            sender.selected = YES;
            [_searchCustomSegementButton setSelected:NO];
            [_searchCustomSegementButton reversal];
            _searchCustomSegementButton = sender;
        }
    }else{
        ascending = [sender reversal];
    }
    NSMutableArray* _sortArray = _dataArray;
    _dataArray = [_sortArray sortwithkey:@"investment_cycle" ascending:ascending];
    [self.tableView scrollsToTop];
    [self.tableView reloadData];
}

- (IBAction)earningButtonTouched:(UIButtonImageOrder *)sender {
    BOOL ascending = YES;
    if (_searchCustomSegementButton != sender) {
        if (sender.selected == NO) {
            sender.selected = YES;
            [_searchCustomSegementButton setSelected:NO];
            [_searchCustomSegementButton reversal];
            _searchCustomSegementButton = sender;
        }
    }else{
        ascending = [sender reversal];
    }
    
    NSMutableArray* _sortArray = _dataArray;
    _dataArray = [_sortArray sortwithkey:@"expected_return_ratef" ascending:ascending];
    [self.tableView scrollsToTop];
    [self.tableView reloadData];
}

- (IBAction)commissionButtonTouched:(UIButtonImageOrder *)sender {
    BOOL ascending = YES;
    if (_searchCustomSegementButton != sender) {
        if (sender.selected == NO) {
            sender.selected = YES;
            [_searchCustomSegementButton setSelected:NO];
            [_searchCustomSegementButton reversal];
            _searchCustomSegementButton = sender;
        }
    }else{
        ascending = [sender reversal];
    }
    
    NSMutableArray* _sortArray = _dataArray;
    _dataArray = [_sortArray sortwithkey:@"return_rate" ascending:ascending];
    [self.tableView scrollsToTop];
    [self.tableView reloadData];
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
            
            [_allProductArray removeAllObjects];
            [_xinTuoProductArray removeAllObjects];
            [_ziguanProductArray removeAllObjects];
            [_simuProductArray removeAllObjects];
            
            NSMutableArray* productArry = [dictionary objectForKey:@"products"];
            for (id dic in productArry) {
                _productOneModel = [[ProductOneParamModel alloc]initWithDictionary:dic];
                [_allProductArray addObject:_productOneModel];
                if ([_productOneModel.product_type isEqualToString:@"信托"]) {
                    [_xinTuoProductArray addObject:_productOneModel];
                }else if ([_productOneModel.product_type isEqualToString:@"资管"]) {
                    [_ziguanProductArray addObject:_productOneModel];
                }else if ([_productOneModel.product_type isEqualToString:@"私募"]) {
                    [_simuProductArray addObject:_productOneModel];
                }
            }
            if (_selectProductType == ProductTypeEnumValue_All) {
                _dataArray = _allProductArray;
            }else if (_selectProductType == ProductTypeEnumValue_Xintuo) {
                _dataArray = _xinTuoProductArray;
            }else if (_selectProductType == ProductTypeEnumValue_Ziguan) {
                _dataArray = _ziguanProductArray;
            }else if (_selectProductType == ProductTypeEnumValue_Simu) {
                _dataArray = _simuProductArray;
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
