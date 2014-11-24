//
//  baseInfoTableViewController.m
//  FinancialSuperman
//
//  Created by Monster on 14-11-19.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "baseInfoTableViewController.h"


#define MIX_CELL_HEIGHT    (44)

@interface baseInfoTableViewController ()

@end

@implementation baseInfoTableViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"详细信息";
    _titleArray = [NSMutableArray arrayWithObjects:@"产品名称:",@"信托类型:",@"收益分配:",@"投资行业:",@"发行规模:",@"发行机构:",@"发行地区:",@"抵押情况:",@"抵押率:",@"募集进度:",@"募集账户:",@"资金投向:",@"还款来源:",@"项目说明:",@"风险控制:",@"担保方介绍:",@"融资方介绍:", nil];
    _cellHeightArray = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_titleArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* str = nil;
    switch (indexPath.row) {
        case 0:
        {
            str = _baseInfo.product_name;
        }
            break;
        case 1:
        {
            str = _baseInfo.product_category;
        }
            break;
        case 2:
        {
            str = _baseInfo.refund_way;
        }
            break;
        case 3:
        {
            str = _baseInfo.investment_category;
        }
            break;
        case 4:
        {
            str = _baseInfo.fund_size;
        }
            break;
        case 5:
        {
            str = _baseInfo.issuer;
        }
            break;
        case 6:
        {
            str = _baseInfo.location;
        }
            break;
        case 7:
        {
            str = _baseInfo.guaranty;
        }
            break;
        case 8:
        {
            str = _baseInfo.guaranty_percent;
        }
            break;
        case 9:
        {
            str = _baseInfo.complete_percent;
        }
            break;
        case 10:
        {
            str = _baseInfo.account_name;
        }
            break;
        case 11:
        {
            str = _baseInfo.investment_orient;
        }
            break;
        case 12:
        {
            str = _baseInfo.repayment_source;
        }
            break;
        case 13:
        {
            str = _baseInfo.note;
        }
            break;
        case 14:
        {
            str = _baseInfo.risk_control;
        }
            break;
        case 15:
        {
            str = _baseInfo.financiers;
        }
            break;
        case 16:
        {
            str = _baseInfo.guarantor;
        }
            break;
            
        default:
            break;
    }
    if ([str isEqualToString:@""]) {
        return 60;
    }
    CGSize size = CGSizeMake(209, 20000.0f);//注：这个宽：300 是你要显示的宽度既固定的宽度，高度可以依照自己的需求而定
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14.0f], NSFontAttributeName,nil];
        size =[str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    return (MIX_CELL_HEIGHT > size.height)?(MIX_CELL_HEIGHT):(size.height + MIX_CELL_HEIGHT - 16);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"baseInfoCell" forIndexPath:indexPath];
    _titleLabel = (UILabel*)[cell viewWithTag:2];
    _titleLabel.text = [_titleArray objectAtIndex:indexPath.row];
    _contentTextView = (UILabel*)[cell viewWithTag:7];
    [_contentTextView removeFromSuperview];
    _contentTextView = (UILabel*)[cell viewWithTag:3];
    switch (indexPath.row) {
        case 0:
        {
            _contentTextView.text = _baseInfo.product_name;
        }
            break;
        case 1:
        {
            _contentTextView.text = _baseInfo.product_category;
        }
            break;
        case 2:
        {
            _contentTextView.text = _baseInfo.refund_way;
        }
            break;
        case 3:
        {
            _contentTextView.text = _baseInfo.investment_category;
        }
            break;
        case 4:
        {
            _contentTextView.text = _baseInfo.fund_size;
        }
            break;
        case 5:
        {
            _contentTextView.text = _baseInfo.issuer;
        }
            break;
        case 6:
        {
            _contentTextView.text = _baseInfo.location;
        }
            break;
        case 7:
        {
            _contentTextView.text = _baseInfo.guaranty;
        }
            break;
        case 8:
        {
            _contentTextView.text = _baseInfo.guaranty_percent;
        }
            break;
        case 9:
        {
            _contentTextView.text = _baseInfo.complete_percent;
        }
            break;
        case 10:
        {
            _contentTextView.text = _baseInfo.account_name;
        }
            break;
        case 11:
        {
            _contentTextView.text = _baseInfo.investment_orient;
        }
            break;
        case 12:
        {
            _contentTextView.text = _baseInfo.repayment_source;
        }
            break;
        case 13:
        {
            _contentTextView.text = _baseInfo.note;
        }
            break;
        case 14:
        {
            _contentTextView.text = _baseInfo.risk_control;
        }
            break;
        case 15:
        {
            _contentTextView.text = @"珠海市土地储备中心成立于2003年，主要职能是在市土地专门管理委员会监督、指导下，代表珠海市人民政府，依照本市土地利用总体规划和城市规模，实施收购、储备、拆迁、平整，以供应和调整各类建设用地需求，有独立的法人地位，也是珠海市城区范围唯一有土地储备资质的机构。";//_baseInfo.financiers;
        }
            break;
        case 16:
        {
            _contentTextView.text = _baseInfo.guarantor;
        }
            break;
            
        default:
            break;
    }
    
    CGSize size = CGSizeMake(209, 20000.0f);//注：这个宽：300 是你要显示的宽度既固定的宽度，高度可以依照自己的需求而定
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_contentTextView.font, NSFontAttributeName,nil];
    size =[_contentTextView.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    _contentTextView.hidden = YES;
    CGRect oldFram = _contentTextView.frame;
    oldFram.size.height = size.height;
//    _contentTextView.bounds = oldFram;
    UILabel* labely = [[UILabel alloc]initWithFrame:oldFram];
    labely.numberOfLines = 100;
    labely.tag = 7;
    if ([_contentTextView.text isEqual:@""]) {
        labely.text = @"-";
    }else{
        labely.text = _contentTextView.text;
    }
    labely.font = _contentTextView.font;
    labely.backgroundColor = _contentTextView.backgroundColor;
    [cell addSubview:labely];
    
    
//    CGSize titleBrandSizeForHeight = [_contentTextView.text sizeWithFont:_contentTextView.font];
//    
//    CGSize titleBrandSizeForLines = [_contentTextView.text sizeWithFont:_contentTextView.font constrainedToSize:CGSizeMake(209, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];
//    
//    
//    _contentTextView.numberOfLines = ceil(titleBrandSizeForLines.height/titleBrandSizeForHeight.height);
//    
//    
//    if (_contentTextView.numberOfLines <= 1) {
//        _contentTextView.frame = CGRectMake(5, _contentTextView.frame.size.height , 209, titleBrandSizeForHeight.height);
//    }else {
//        _contentTextView.frame = CGRectMake(5, _contentTextView.frame.size.height , 209,_contentTextView.numberOfLines*titleBrandSizeForHeight.height);
//    }
    
//    NSTextContainer *container = [[NSTextContainer alloc] initWithSize:CGSizeMake(_contentTextView.frame.size.width, CGFLOAT_MAX)]; // new in iOS 7.0
//    container.heightTracksTextView = YES; //
//    _contentTextView = [_contentTextView initWithFrame:_contentTextView.frame textContainer:container];
//    _contentTextView.editable = NO;
//    CGFloat height = _contentTextView.contentSize.height;
//    CGRect rect = _contentTextView.frame;
//    rect.size.height = height;
//    [_contentTextView setFrame:rect];
//    // Configure the cell...
//    [_cellHeightArray addObject:[NSNumber numberWithInteger:_contentTextView.contentSize.height]];
    return cell;
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

@end
