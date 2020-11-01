//
//  TicketOrderChoosePeriodCollectionViewCell.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/30.
//

#import "TicketOrderChoosePeriodCollectionViewCell.h"

@interface TicketOrderChoosePeriodCollectionViewCell ()
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *detailLabel;
@end

@implementation TicketOrderChoosePeriodCollectionViewCell

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = HEXCOLOR_TextColor_Black;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"8:30-09:45";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}


- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = HEXCOLOR_TextColor_Black;
        _detailLabel.font = [UIFont systemFontOfSize:13];
        _detailLabel.text = @"有票";
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RandomColor;
        
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.sd_layout.centerXEqualToView(self.contentView).topSpaceToView(self.contentView, MARGIN_10).heightIs(MARGIN_15).widthIs(80);
        

        [self.contentView addSubview:self.detailLabel];
        self.detailLabel.sd_layout.centerXEqualToView(self.contentView).topSpaceToView(self.titleLabel, 8.5).heightIs(12).widthIs(80);

    }
    return self;
}


@end
