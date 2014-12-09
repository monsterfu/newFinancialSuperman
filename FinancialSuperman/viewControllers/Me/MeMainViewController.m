//
//  MeMainViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-1.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MeMainViewController.h"

#define BUTTON_WIDTH   (80)

#define TABController_Height    (40)

@interface MeMainViewController () <DKScrollingTabControllerDelegate>

@end

@implementation MeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    leftTabController = [[DKScrollingTabController alloc] init];
    leftTabController.delegate = self;
    [self addChildViewController:leftTabController];
    [leftTabController didMoveToParentViewController:self];
    [self.view addSubview:leftTabController.view];
    
    leftTabController.view.frame = CGRectMake(0, 0, BUTTON_WIDTH*5, TABController_Height);
    
    leftTabController.view.backgroundColor = [UIColor whiteColor];
    leftTabController.buttonPadding = 20;
    leftTabController.underlineIndicator = YES;
    leftTabController.underlineIndicatorColor = [UIColor getColor:@"F89D40"];
    leftTabController.buttonsScrollView.showsHorizontalScrollIndicator = NO;
    leftTabController.selectedBackgroundColor = [UIColor getColor:@"EBEBEB"];
    leftTabController.selectedTextColor = [UIColor getColor:@"F89D40"];
    leftTabController.unselectedTextColor = [UIColor grayColor];
    leftTabController.unselectedBackgroundColor = [UIColor getColor:@"EBEBEB"];
    leftTabController.startingIndex = 0;
    leftTabController.buttonTitleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    
    leftTabController.selection = @[@"PLACE\n0", @"PLACE\n0", @"PLACE\n0", @"PLACE\n0", @"PLACE\n0"];
    [leftTabController setButtonName:@"关注" atIndex:0];
    [leftTabController setButtonName:@"订单" atIndex:1];
    [leftTabController setButtonName:@"佣金" atIndex:2];
    [leftTabController setButtonName:@"管理" atIndex:3];
    
    
    [leftTabController.buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *button = obj;
        button.titleLabel.numberOfLines = 1;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    }];
    
    
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    _meAttentionViewController = [storyBoard instantiateViewControllerWithIdentifier:@"meAttentionViewControllerIdentifier"];
    _meOrderListViewController  = [storyBoard instantiateViewControllerWithIdentifier:@"MeOrderListViewControllerIdentifier"];
    _meCommissionViewController = [storyBoard instantiateViewControllerWithIdentifier:@"meCommissionViewControllerIdentifier"];
    _meManageViewController = [storyBoard instantiateViewControllerWithIdentifier:@"meManageViewControllerIdentifier"];
    _meManageViewController.delegate = self;
    _meAttentionViewController.delegate = self;
    _meOrderListViewController.delegate = self;
    
    
    _controllerArry = @[_meAttentionViewController,_meOrderListViewController,_meCommissionViewController,_meManageViewController];
    
    [_meAttentionViewController.view setFrame:CGRectOffset(CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height), DEVICE_WIDTH*0, TABController_Height)];
    [_meOrderListViewController.view setFrame:CGRectOffset(CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height), DEVICE_WIDTH*1, TABController_Height)];
    [_meCommissionViewController.view setFrame:CGRectOffset(CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height), DEVICE_WIDTH*2, TABController_Height)];
    [_meManageViewController.view setFrame:CGRectOffset(CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height), DEVICE_WIDTH*3, TABController_Height)];
    
    [_scrollView setContentSize:CGSizeMake(4*DEVICE_WIDTH, 0)];
    
    [_scrollView addSubview:_meAttentionViewController.view];
    [_scrollView addSubview:_meOrderListViewController.view];
    [_scrollView addSubview:_meManageViewController.view];
    [_scrollView addSubview:_meCommissionViewController.view];
    [_scrollView setDelegate:self];
    
    if ([USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        [_personButtonItem setEnabled:YES];
    }else{
        [_personButtonItem setEnabled:NO];
    }
    
    if (![USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO]) {
        _remindLoginViewController  = [storyBoard instantiateViewControllerWithIdentifier:@"RemindLoginVCIdentifier"];
        _remindLoginViewController.delegate = self;
        [self.view addSubview:_remindLoginViewController.view];
        [self.view bringSubviewToFront:_remindLoginViewController.view];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userBeLogin) name:NSNotificationCenter_userbeLogin object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userBeLogout) name:NSNotificationCenter_userbeLogout object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --
#pragma mark --userBeLogin
-(void)userBeLogin
{
    [_personButtonItem setEnabled:YES];
    [_remindLoginViewController.view removeFromSuperview];
}

-(void)userBeLogout
{
    [_personButtonItem setEnabled:NO];
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _remindLoginViewController  = [storyBoard instantiateViewControllerWithIdentifier:@"RemindLoginVCIdentifier"];
    _remindLoginViewController.delegate = self;
    [self.view addSubview:_remindLoginViewController.view];
    [self.view bringSubviewToFront:_remindLoginViewController.view];
}
#pragma mark - TabControllerDelegate

- (void)DKScrollingTabController:(DKScrollingTabController *)controller selection:(NSUInteger)selection {
    NSLog(@"Selection controller action button with index=%d",selection);
    
    [_scrollView scrollRectToVisible:[(UIViewController*)[_controllerArry objectAtIndex:selection] view].frame animated:YES];
    
}
#pragma mark - ScrollDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating:%f,%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
    if (scrollView.contentOffset.x < DEVICE_WIDTH) {
        [leftTabController selectButtonWithIndex:0];
    }else if((scrollView.contentOffset.x <= DEVICE_WIDTH)&&(scrollView.contentOffset.x < DEVICE_WIDTH*2)) {
        [leftTabController selectButtonWithIndex:1];
    }else if((scrollView.contentOffset.x <= DEVICE_WIDTH*2)&&(scrollView.contentOffset.x < DEVICE_WIDTH*3)) {
        [leftTabController selectButtonWithIndex:2];
    }else {
        [leftTabController selectButtonWithIndex:3];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark --
#pragma mark --
-(void)loginAc{
    [self.navigationController.tabBarController performSegueWithIdentifier:@"userLoginIdentifier" sender:nil];
}
- (IBAction)personButtonTouched:(UIBarButtonItem *)sender {
    [self.navigationController.tabBarController performSegueWithIdentifier:@"meInfoViewIdentifier" sender:nil];
}
#pragma mark --
#pragma mark MeAttentionViewControllerDelegate
-(void)MeAttentionViewController_CellSelected:(attentionProductModel*)attetionModel
{
    [self.navigationController.tabBarController performSegueWithIdentifier:@"searchDetailIdentifier" sender:attetionModel];
}
#pragma mark --
#pragma mark MeManageViewControllerDelegate
-(void)MeManageViewController_AddNewCard
{
    [self.navigationController.tabBarController performSegueWithIdentifier:@"addBankCardIdentifier" sender:nil];
}
#pragma mark --
#pragma mark MeOrderListViewControllerDelegate
-(void)MeOrderListViewController_CellSelected:(orderProductModel*)orderModel
{
    [self.navigationController.tabBarController performSegueWithIdentifier:@"orderDetailIdentifier" sender:orderModel];
}
@end
