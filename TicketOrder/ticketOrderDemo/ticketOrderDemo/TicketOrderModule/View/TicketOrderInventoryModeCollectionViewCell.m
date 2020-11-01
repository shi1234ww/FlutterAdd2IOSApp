//
//  TicketOrderInventoryModeCollectionViewCell.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/29.
//

#import "TicketOrderInventoryModeCollectionViewCell.h"

@interface TicketOrderInventoryModeCollectionViewCell ()


@property(nonatomic, strong) UILabel *titleLabel;


@property(nonatomic, strong) UILabel *dateLabel;


@property(nonatomic, strong) UILabel *detailLabel;


@end

@implementation TicketOrderInventoryModeCollectionViewCell


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = HEXCOLOR_TextColor_Black;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"今天";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.textColor = HEXCOLOR_TextColor_Black;
        _dateLabel.font = [UIFont systemFontOfSize:13];
        _dateLabel.text = @"04-23";
        _dateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dateLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = HEXCOLOR_TextColor_Black;
        _detailLabel.font = [UIFont systemFontOfSize:13];
        _detailLabel.text = @"￥40";
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
        self.titleLabel.sd_layout.centerXEqualToView(self.contentView).topSpaceToView(self.contentView, MARGIN_10).heightIs(MARGIN_15).widthIs(50);
        

        
        [self.contentView addSubview:self.dateLabel];
        self.dateLabel.sd_layout.centerXEqualToView(self.contentView).topSpaceToView(self.titleLabel, 5).heightIs(MARGIN_15).widthIs(50);

        [self.contentView addSubview:self.detailLabel];
        self.detailLabel.sd_layout.centerXEqualToView(self.contentView).topSpaceToView(self.dateLabel, 5).heightIs(MARGIN_15).widthIs(50);

        
    }
    return self;
}


@end
