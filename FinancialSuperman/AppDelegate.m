//
//  AppDelegate.m
//  FinancialSuperman
//
//  Created by Monster on 14-10-29.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    NSString* userName = [USER_DEFAULT objectForKey:KEY_USERNAME_INFO];
    NSString* passWord = [USER_DEFAULT objectForKey:KEY_PASSWORD_INFO];
    
    [USER_DEFAULT setBool:NO forKey:KEY_ISLOGIN_INFO];
#if 1
    if (userName && passWord&&[USER_DEFAULT boolForKey:KEY_ISLOGIN_WHEN_EXIT_INFO]) {
        [HttpRequest userLoginRequest:[LoginModel stanceWithUserName:userName password:passWord captcha:@""] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_ProductAll];
    }
#else
    [HttpRequest userLoginRequest:[LoginModel stanceWithUserName:userName password:passWord captcha:@""] delegate:self finishSel:@selector(GetResult:) failSel:@selector(GetErr:) tag:TAG_ProductAll];
#endif
    
    //目前此项暂时写死
    if ([USER_DEFAULT objectForKey:KEY_APPKEY_INFO] == nil) {
        [USER_DEFAULT setObject:@"licai670a083b7b2738d8285b89da2ed82" forKey:KEY_APPKEY_INFO];
    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    BOOL last = [USER_DEFAULT boolForKey:KEY_ISLOGIN_INFO];
    [USER_DEFAULT removeObjectForKey:KEY_ISLOGIN_WHEN_EXIT_INFO];
    [USER_DEFAULT setBool:last forKey:KEY_ISLOGIN_WHEN_EXIT_INFO];
    [USER_DEFAULT synchronize];
}

#pragma mark http result
-(void) GetErr:(ASIHTTPRequest *)request
{
    //    [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
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
        [USER_DEFAULT removeObjectForKey:KEY_TOKEN_INFO];
        [USER_DEFAULT removeObjectForKey:KEY_ISLOGIN_INFO];
        [USER_DEFAULT setObject:[dictionary objectForKey:@"token"] forKey:KEY_TOKEN_INFO];
        [USER_DEFAULT setBool:YES forKey:KEY_ISLOGIN_INFO];
        [USER_DEFAULT synchronize];
        [[NSNotificationCenter defaultCenter]postNotificationName:NSNotificationCenter_userbeLogin object:nil];
    }else{
        //        [ProgressHUD showError:@"获取失败，请检查网络连接是否正常!"];
    }
}
@end
