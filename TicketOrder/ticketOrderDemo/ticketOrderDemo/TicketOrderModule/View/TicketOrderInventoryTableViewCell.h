//
//  TicketOrderInventoryTableViewCell.h
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/28.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TicketOrderInventoryTableViewCellDelegate <NSObject>

- (void)moreDateBtnDidClick;

@end

@interface TicketOrderInventoryTableViewCell : BaseTableViewCell

@property(nonatomic, weak) id<TicketOrderInventoryTableViewCellDelegate> delegate;



@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, copy) void (^moreButtonClickedBlock)(NSIndexPath *indexPath);


@property(nonatomic, strong) OptionModel *model;



@property(nonatomic, strong) NSMutableArray *periodDataSourceArray;
@end

NS_ASSUME_NONNULL_END
