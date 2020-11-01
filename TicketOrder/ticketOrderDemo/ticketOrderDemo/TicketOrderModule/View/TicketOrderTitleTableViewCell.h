//
//  TicketOrderTitleTableViewCell.h
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/28.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketOrderTitleTableViewCell : BaseTableViewCell

@property(nonatomic, strong) UIView *topGrayView;
// 标题
@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UIView *bottomGrayView;
@end

NS_ASSUME_NONNULL_END
