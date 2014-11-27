//
//  checkCodeTableViewCell.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-14.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "checkCodeTableViewCell.h"

@implementation checkCodeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    countNum = 60;
    _userNameTextField = (UITextField*)[self viewWithTag:1];
    checkCodeButton = (UIButton*)[self viewWithTag:2];
    [checkCodeButton addTarget:self action:@selector(checkButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)checkButtonTouched:(UIButton*)sender
{
    if (_userNameTextField.text.length != 11) {
        [ProgressHUD showError:@"手机号位数不对！"];
        return;
    }
    [sender setSelected:YES];
    sender.titleLabel.text = [NSString stringWithFormat:@"重新获取(%lu)",(unsigned long)countNum];
    countdownTimer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(countDownAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:countdownTimer forMode:NSRunLoopCommonModes];
    [HttpRequest fetchCheckCodeRequest:[NSMutableDictionary dictionaryWithObjects:@[[USER_DEFAULT objectForKey:KEY_APPKEY_INFO],[NSNumber numberWithInteger:0],_userNameTextField.text] forKeys:@[@"appkey",@"debug",@"phone"]] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_ProductAll];
}
-(void)countDownAction
{
    if (countNum > 0) {
        countNum --;
    }else{
        countNum = 60;
        [checkCodeButton setSelected:NO];
        [countdownTimer invalidate];
        checkCodeButton.titleLabel.text = @"获取验证码";
    }
    checkCodeButton.titleLabel.text = [NSString stringWithFormat:@"重新获取(%lu)",(unsigned long)countNum];
}

#pragma mark http result
-(void) GetErr:(ASIHTTPRequest *)request
{
    [countdownTimer invalidate];
    [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
    countNum = 60;
    [checkCodeButton setSelected:NO];
    checkCodeButton.titleLabel.text = @"获取验证码";
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
        _token = [dictionary objectForKey:@"token"];
        [USER_DEFAULT removeObjectForKey:KEY_CHECKCODE_TOKEN_INFO];
        [USER_DEFAULT setObject:_token forKey:KEY_CHECKCODE_TOKEN_INFO];
        [USER_DEFAULT synchronize];
    }else{
        [countdownTimer invalidate];
        [ProgressHUD showError:@"数据出错！"];
        countNum = 60;
        [checkCodeButton setSelected:NO];
        checkCodeButton.titleLabel.text = @"获取验证码";
    }
}
@end
