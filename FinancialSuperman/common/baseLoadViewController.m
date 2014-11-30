//
//  baseLoadViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-25.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "baseLoadViewController.h"

@interface baseLoadViewController ()

@end

@implementation baseLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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

-(void)startLoadView:(UIView*)view
{
    _loadViewController = nil;
    if (_loadViewController == nil) {
        UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        _loadViewController  = [storyBoard instantiateViewControllerWithIdentifier:@"loadViewControllerIdentifier"];
        [view addSubview:_loadViewController.view];
        [view bringSubviewToFront:_loadViewController.view];
    }
    [_loadViewController.fingerImageView setHidden:YES];
    [_loadViewController.refreshLabel setHidden:YES];
    [_loadViewController.label setHidden:NO];
    [_loadViewController.indicatorView startAnimating];
    [_loadViewController.label setText:@"正在加载中..."];
    [_loadViewController.view addGestureRecognizer:_loadViewController.gestureRecognizer];
    [_loadViewController setDelegate:self];
}
-(void)endLoadView
{
    [_loadViewController.view removeGestureRecognizer:_loadViewController.gestureRecognizer];
    [_loadViewController.view removeFromSuperview];
}
-(void)mistakeLoadView
{
    [_loadViewController.fingerImageView setHidden:NO];
    [_loadViewController.refreshLabel setHidden:NO];
    [_loadViewController.indicatorView stopAnimating];
    [_loadViewController.label setHidden:YES];
}

@end
