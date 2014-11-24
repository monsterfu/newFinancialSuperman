//
//  RemindLoginViewController.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-14.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RemindLoginDelage <NSObject>
-(void)loginAc;
@end

@interface RemindLoginViewController : UIViewController

@property(nonatomic,assign)id<RemindLoginDelage>delegate;

- (IBAction)loginButtonTouch:(UIButton *)sender;

@end
