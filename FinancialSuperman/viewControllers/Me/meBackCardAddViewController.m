//
//  meBackCardAddViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-12-5.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "meBackCardAddViewController.h"

@interface meBackCardAddViewController ()

@end

@implementation meBackCardAddViewController


-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleArray = @[@"持卡人", @"卡号"];
    self.title = @"添加银行卡";
    
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
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 34;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _cell = [tableView dequeueReusableCellWithIdentifier:@"addCardCellIdentifier" forIndexPath:indexPath];
    _titleLabel = (UILabel*)[_cell viewWithTag:1];
    _titleLabel.text = [_titleArray objectAtIndex:indexPath.row];
    
    if (indexPath.row == 0) {
        _nameTextField = (UITextField*)[_cell viewWithTag:2];
        _nameTextField.keyboardType = UIKeyboardTypeDefault;
    }else{
        _cardTextField = (UITextField*)[_cell viewWithTag:2];
        _cardTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _cell;
}

#pragma mark --
#pragma mark -- UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSString *text = [textField text];
    
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    text = [text stringByReplacingCharactersInRange:range withString:string];
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *newString = @"";
    while (text.length > 0) {
        NSString *subString = [text substringToIndex:MIN(text.length, 4)];
        newString = [newString stringByAppendingString:subString];
        if (subString.length == 4) {
            newString = [newString stringByAppendingString:@" "];
        }
        text = [text substringFromIndex:MIN(text.length, 4)];
    }
    
    newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    
    if (newString.length >= 20) {
        return NO;
    }
    
    [textField setText:newString];
    
    return NO;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}


@end
