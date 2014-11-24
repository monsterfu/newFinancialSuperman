//
//  loadViewContoller.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-10.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "loadViewContoller.h"

@interface loadViewContoller ()

@end

@implementation loadViewContoller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(restartTouch)];
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
-(void)restartTouch
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(refreshAction)]) {
        [self.delegate refreshAction];
    }
}
@end
