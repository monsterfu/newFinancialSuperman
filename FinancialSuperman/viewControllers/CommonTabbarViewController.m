//
//  CommonTabbarViewController.m
//  Mio
//
//  Created by 符鑫 on 14-8-27.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "CommonTabbarViewController.h"
#import "UIColor+getColor.h"
#import "productDetailViewController.h"
#import "ProductOneParamModel.h"
#import "Me/MeOrderDetailViewController.h"
#import "OnListDetailViewController.h"

@interface CommonTabbarViewController ()

@end

@implementation CommonTabbarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tabBar setTintColor:[UIColor getColor:@"F89D40"]];
    [self.tabBar setSelectedImageTintColor:[UIColor getColor:@"F89D40"]];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
//    [self.navigationController setNavigationBarHidden:YES];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    [backItem setBackButtonBackgroundImage:[UIImage imageNamed:@"navi_custom_back_btn_normal.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefaultPrompt];
    self.navigationItem.backBarButtonItem = backItem;
    backItem.title = @" ";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"searchDetailIdentifier"])
    {
        if ([sender isKindOfClass:[ProductOneParamModel class]]) {
            ProductOneParamModel* _product = (ProductOneParamModel*)sender;
            productDetailViewController *vc = (productDetailViewController *) segue.destinationViewController;
            [vc setProductOne:_product];
            
        }else if ([sender isKindOfClass:[attentionProductModel class]]){
            attentionProductModel* _product = (attentionProductModel*)sender;
            productDetailViewController *vc = (productDetailViewController *) segue.destinationViewController;
            [vc setAttentionOne:_product];
        }
        
    }else if ([segue.identifier isEqualToString:@"orderDetailIdentifier"])
    {
        orderProductModel* _product = (orderProductModel*)sender;
        MeOrderDetailViewController*vc = (MeOrderDetailViewController *) segue.destinationViewController;
        [vc setOrderProductModel:_product];
    }else if ([segue.identifier isEqualToString:@"addBankCardIdentifier"])
    {
        bankCardModel* _product = (bankCardModel*)sender;
        meBackCardAddViewController*vc = (meBackCardAddViewController *) segue.destinationViewController;
        [vc setCardModel:_product];
    }else if ([segue.identifier isEqualToString:@"OnlistDetailIdentifier"])
    {
        if ([sender isKindOfClass:[ProductOneParamModel class]]) {
            ProductOneParamModel* _product = (ProductOneParamModel*)sender;
            OnListDetailViewController *vc = (OnListDetailViewController *) segue.destinationViewController;
            [vc setProductOne:_product];
        }
    }
}


@end
