//
//  TicketOrderValidityTableViewCell.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/28.
//

#import "TicketOrderValidityTableViewCell.h"

@implementation TicketOrderValidityTableViewCell

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = HEXCOLOR_TextColor_Black;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"有效日期 购买数量";
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = HEXCOLOR_TextColor_Black;
        _detailLabel.font = BOLDSYSTEMFONT(18);
        _detailLabel.text = @"2020-03-01至2020-03-31有效 ";
    }
    return _detailLabel;
}

- (UILabel *)subDetailLabel{
    if (!_subDetailLabel) {
        _subDetailLabel = [[UILabel alloc] init];
        _subDetailLabel.textColor = HEXCOLOR_TextColor_Gray_AEAEAE;
        _subDetailLabel.font = [UIFont systemFontOfSize:15];
        _subDetailLabel.text = @" 周一周三不可用 3月1日/3月2日/3月3日/不可用";
    }
    return _subDetailLabel;
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.contentView, 24.5).rightSpaceToView(self.contentView, 0).heightIs(20);
        
        [self.contentView addSubview:self.detailLabel];
        self.detailLabel.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.titleLabel, MARGIN_10).rightSpaceToView(self.contentView, MARGIN_15).autoHeightRatio(0);
        
        [self.contentView addSubview:self.subDetailLabel];
        self.subDetailLabel.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.detailLabel, MARGIN_10).rightSpaceToView(self.contentView, MARGIN_15).autoHeightRatio(0);
        
        
       
        
        [self setupAutoHeightWithBottomView:self.subDetailLabel bottomMargin:MARGIN_10];
    }
    return self;
}

@end
