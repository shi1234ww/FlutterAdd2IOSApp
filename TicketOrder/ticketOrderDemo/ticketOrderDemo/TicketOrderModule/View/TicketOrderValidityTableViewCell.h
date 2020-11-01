//
//  TicketOrderValidityTableViewCell.h
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/28.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketOrderValidityTableViewCell : BaseTableViewCell
// 标题
@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UILabel *detailLabel;

@property(nonatomic, strong) UILabel *subDetailLabel;


@end

NS_ASSUME_NONNULL_END
