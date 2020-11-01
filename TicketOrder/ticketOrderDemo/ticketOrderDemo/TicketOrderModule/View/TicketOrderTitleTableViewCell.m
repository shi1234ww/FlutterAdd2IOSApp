//
//  TicketOrderTitleTableViewCell.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/28.
//

#import "TicketOrderTitleTableViewCell.h"

@implementation TicketOrderTitleTableViewCell

-(UIView *)topGrayView{
    if (!_topGrayView) {
        _topGrayView = [[UIView alloc] init];
        _topGrayView.backgroundColor = HEXCOLOR_BackgroundView_Gray;
    }
    return _topGrayView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = HEXCOLOR_TextColor_Black;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.text = @"周日日常不限时门票，产品名称最多两行产品名称 最多两行";
    }
    return _titleLabel;
}

-(UIView *)bottomGrayView{
    if (!_bottomGrayView) {
        _bottomGrayView = [[UIView alloc] init];
        _bottomGrayView.backgroundColor = HEXCOLOR_BackgroundView_Gray;
    }
    return _bottomGrayView;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.topGrayView];
        self.topGrayView.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(5);
        
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.topGrayView, 32.5).rightSpaceToView(self.contentView, MARGIN_15).autoHeightRatio(0);
        
        [self.contentView addSubview:self.bottomGrayView];
        self.bottomGrayView.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.titleLabel, 27.5).rightSpaceToView(self.contentView, 0).heightIs(5);
        
        
        [self setupAutoHeightWithBottomView:self.bottomGrayView bottomMargin:0];
    }
    return self;
}

@end
