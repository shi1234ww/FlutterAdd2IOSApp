//
//  TicketOrderViewController.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/30.
//

#import "TicketOrderViewController.h"
#import "TicketOrderTitleTableViewCell.h"
#import "TicketOrderValidityTableViewCell.h"
#import "TicketOrderInventoryTableViewCell.h"
#import "TicketOrderBuyDetailsTableViewCell.h"
#import "TicketOrderEditUserInfoTableViewCell.h"
#import "HYStepper.h"
#import "TicketOrderCalendarViewController.h"
#import "TicketOrderVCBottomView.h"

@interface TicketOrderViewController ()<UITableViewDelegate, UITableViewDataSource, TicketOrderVCBottomViewDelegate>

@property(nonatomic, strong) NSMutableArray *dataArr;

@property(nonatomic, assign) BOOL isPeriodMode;

@property(nonatomic, strong) TicketOrderVCBottomView *ticketOrderVCBottomView;

@end


//{
//section0 :  产品名称 + 上下灰条  cell
//section1  :  有效期 || (日库存 + 分时段库存)两种 cell
//section2 :  购买规则 + 购买数量 +  购买数量规则 + 灰条 + 游客信息 cell
//section3 :  游客信息填写 {   需要身份证,  不需要身份证}   两种 cell
//}
@implementation TicketOrderViewController

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithObjects:@"1", nil ];
    }
    return _dataArr;
}

-(TicketOrderVCBottomView *)ticketOrderVCBottomView{
    if (!_ticketOrderVCBottomView) {
        _ticketOrderVCBottomView = [[TicketOrderVCBottomView alloc] initWithFrame:(CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH, 50))];
        _ticketOrderVCBottomView.delegate = self;
    }
    return _ticketOrderVCBottomView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainTableView];
    self.mainTableView.frame = CGRectMake(0, NAVIGATIONBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT- 50) ;
    
        
    [self.view addSubview:self.ticketOrderVCBottomView];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        TicketOrderTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSEIDENTIFIER];
        if (!cell) {
            cell = [[TicketOrderTitleTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CELL_REUSEIDENTIFIER];
        }
        return cell;

    }else if (indexPath.section == 1){
//        TicketOrderValidityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSEUDENTIFIER1];
//        if (!cell) {
//            cell = [[TicketOrderValidityTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CELL_REUSEUDENTIFIER1];
//        }
//        return cell;
        TicketOrderInventoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TicketOrderInventoryTableViewCell"];
        if (!cell) {
            cell = [[TicketOrderInventoryTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CELL_REUSEUDENTIFIER1];
        }
        
        cell.indexPath = indexPath;
        WeakSelf
        if (!cell.moreButtonClickedBlock) {
            [cell setMoreButtonClickedBlock:^(NSIndexPath * _Nonnull indexPath) {
                
                TicketOrderCalendarViewController *vc = [[TicketOrderCalendarViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                
//                weakSelf.isPeriodMode = YES;
//                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//                NSLog(@"%@ , reloaded", indexPath);
            }];
        }
        ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
        [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
        OptionModel *model = [[OptionModel alloc] init];
        model.isPeriodMode = weakSelf.isPeriodMode;
        cell.model = model;
        return cell;

    }else if (indexPath.section == 2){
        TicketOrderBuyDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSEUDENTIFIER2];
        if (!cell) {
            cell = [[TicketOrderBuyDetailsTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CELL_REUSEUDENTIFIER2];
        }
        
        cell.stepper.valueChanged = ^(double value) {
            int finalCount = (int)value;


            NSMutableArray *tmpIndexPathArr = [NSMutableArray array];
            if (finalCount > self.dataArr.count) {

                NSUInteger moreCount = finalCount - self.dataArr.count;
                //         2           4            2
                
                for (int i = 0 ; i < moreCount; i++) {
                    [self.dataArr addObject:@"1"];
                    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.dataArr.count-1 inSection:3];
                    [tmpIndexPathArr addObject:newIndexPath];
                }
                // newIndexPath[] = {3:2} {3:3}
                //                                  4
                NSLog(@"%d  ,|| %ld  ||  %@ ", finalCount,self.dataArr.count, tmpIndexPathArr);
                
                [tableView beginUpdates];
                [tableView insertRowsAtIndexPaths:tmpIndexPathArr withRowAnimation:(UITableViewRowAnimationBottom)];
                [tableView endUpdates];
                
                
            }else if (finalCount < self.dataArr.count){
                NSUInteger moreCount = self.dataArr.count - finalCount;
                
                for (int i = 0 ; i < moreCount; i++) {
                    [self.dataArr removeObjectAtIndex: (self.dataArr.count-1) ];
                    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.dataArr.count inSection:3];
                    [tmpIndexPathArr addObject:newIndexPath];
                }
                
                [tableView beginUpdates];
                [tableView deleteRowsAtIndexPaths:tmpIndexPathArr withRowAnimation:(UITableViewRowAnimationBottom)];
                [tableView endUpdates];
                
                
                
            }

            
            
           
        };
        return cell;

    }else if (indexPath.section == 3){
        TicketOrderEditUserInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSEUDENTIFIER3];
        if (!cell) {
            cell = [[TicketOrderEditUserInfoTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CELL_REUSEUDENTIFIER3];
        }
        OptionModel *model = [[OptionModel alloc] init];
        model.optionID = [NSString stringWithFormat:@"%ld", indexPath.row+1];
        cell.model = model;
        return cell;

    }else{
        return nil;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 3) {
        return self.dataArr.count;
    }else{
        return 1;
    }
    
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}



#pragma mark - TicketOrderVCBottomViewDelegate
-(void)orderLabelDidTap{
//    [TOASTVIEW showWithText:@"orderLabelDidTap"];
    NSLog(@"orderLabelDidTap" );
}

@end
