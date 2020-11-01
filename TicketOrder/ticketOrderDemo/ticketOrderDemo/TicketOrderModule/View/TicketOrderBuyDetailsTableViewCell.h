//
//  TicketOrderBuyDetailsTableViewCell.h
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/28.
//

#import "BaseTableViewCell.h"
#import "HYStepper.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TicketOrderBuyDetailsTableViewCellDelegate <NSObject>

- (void)s;

@end

@interface TicketOrderBuyDetailsTableViewCell : BaseTableViewCell


@property(nonatomic, strong) HYStepper *stepper;




@end
NS_ASSUME_NONNULL_END
