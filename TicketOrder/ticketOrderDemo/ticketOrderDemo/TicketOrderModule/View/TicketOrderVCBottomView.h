//
//  TicketOrderVCBottomView.h
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TicketOrderVCBottomViewDelegate <NSObject>

- (void)orderLabelDidTap;

@end

@interface TicketOrderVCBottomView : UIView
@property(nonatomic, weak) id<TicketOrderVCBottomViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
