//
//  loadViewContoller.h
//  FinancialSuperman
//
//  Created by Monster on 14-11-10.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIViewControllerLoadViewDelegate <NSObject>
-(void)refreshAction;
@end

@interface loadViewContoller : UIViewController

@property (nonatomic,assign)id<UIViewControllerLoadViewDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIImageView *fingerImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *refreshLabel;


@property (nonatomic,retain)UITapGestureRecognizer* gestureRecognizer;

@end
