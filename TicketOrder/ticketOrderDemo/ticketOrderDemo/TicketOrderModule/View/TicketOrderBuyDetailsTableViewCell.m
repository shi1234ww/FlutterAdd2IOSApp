//
//  TicketOrderBuyDetailsTableViewCell.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/28.
//

#import "TicketOrderBuyDetailsTableViewCell.h"


@interface TicketOrderBuyDetailsTableViewCell ()

@property(nonatomic, strong) UIView *buyRulesBackgroundView;

@property(nonatomic, strong) UILabel *buyTimeLabel;

@property(nonatomic, strong) UILabel *refundRulesLabel;

@property(nonatomic, strong) UILabel *buyCountTitleLabel;



@property(nonatomic, strong) UIView *buyCountRulesBackgroundView;

@property(nonatomic, strong) UILabel *buyCountRulesLabel;

@property(nonatomic, strong) UIView *bottomGrayLineView;

@property(nonatomic, strong) UILabel *visitorInfoTitleLabel;

@end

@implementation TicketOrderBuyDetailsTableViewCell


-(UIView *)buyRulesBackgroundView{
    if (!_buyRulesBackgroundView) {
        _buyRulesBackgroundView = [[UIView alloc] init];
        _buyRulesBackgroundView.backgroundColor = HEXCOLOR_BackgroundView_Gray;
    }
    return _buyRulesBackgroundView;
}

- (UILabel *)buyTimeLabel{
    if (!_buyTimeLabel) {
        _buyTimeLabel = [[UILabel alloc] init];
        _buyTimeLabel.textColor = HEXCOLOR_TextColor_Gray_AEAEAE;
        _buyTimeLabel.font = [UIFont systemFontOfSize:12];
        _buyTimeLabel.text = @"随买随用";
    }
    return _buyTimeLabel;
}

- (UILabel *)refundRulesLabel{
    if (!_refundRulesLabel) {
        _refundRulesLabel = [[UILabel alloc] init];
        _refundRulesLabel.textColor = HEXCOLOR_TextColor_Gray_AEAEAE;
        _refundRulesLabel.font = [UIFont systemFontOfSize:12];
        _refundRulesLabel.text = @"未消费随时退未消费未消";
    }
    return _refundRulesLabel;
}

- (UILabel *)buyCountTitleLabel{
    if (!_buyCountTitleLabel) {
        _buyCountTitleLabel = [[UILabel alloc] init];
        _buyCountTitleLabel.textColor = HEXCOLOR_TextColor_Black;
        _buyCountTitleLabel.font = [UIFont systemFontOfSize:15];
        _buyCountTitleLabel.text = @"购买数量";
    }
    return _buyCountTitleLabel;
}

-(HYStepper *)stepper{
    if (!_stepper) {
        _stepper = [[HYStepper alloc] init];
    }
    return _stepper;
}

-(UIView *)buyCountRulesBackgroundView{
    if (!_buyCountRulesBackgroundView) {
        _buyCountRulesBackgroundView = [[UIView alloc] init];
        _buyCountRulesBackgroundView.backgroundColor = HEXCOLOR_BackgroundView_Gray;
    }
    return _buyCountRulesBackgroundView;
}


-(UILabel *)buyCountRulesLabel{
    if (!_buyCountRulesLabel) {
        _buyCountRulesLabel = [[UILabel alloc] init];
        _buyCountRulesLabel.textColor = HEXCOLOR_TextColor_Gray_AEAEAE;
        _buyCountRulesLabel.font = [UIFont systemFontOfSize:12];
        _buyCountRulesLabel.text = @"同一帐号2天内最多购买1张";
    }
    return _buyCountRulesLabel;
}

-(UIView *)bottomGrayLineView{
    if (!_bottomGrayLineView) {
        _bottomGrayLineView = [[UIView alloc] init];
        _bottomGrayLineView.backgroundColor = HEXCOLOR_BackgroundView_Gray;
    }
    return _bottomGrayLineView;
}

- (UILabel *)visitorInfoTitleLabel{
    if (!_visitorInfoTitleLabel) {
        _visitorInfoTitleLabel = [[UILabel alloc] init];
        _visitorInfoTitleLabel.textColor = HEXCOLOR_TextColor_Black;
        _visitorInfoTitleLabel.font = [UIFont systemFontOfSize:18];
        _visitorInfoTitleLabel.text = @"游客信息";
    }
    return _visitorInfoTitleLabel;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.buyRulesBackgroundView];
        self.buyRulesBackgroundView.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, MARGIN_15);
        [self.buyRulesBackgroundView setupAutoHeightWithBottomView:self.refundRulesLabel bottomMargin:6.5];
        
        
        [self.buyRulesBackgroundView addSubview:self.buyTimeLabel];
        self.buyTimeLabel.sd_layout.leftSpaceToView(self.buyRulesBackgroundView, 6.5).topSpaceToView(self.buyRulesBackgroundView, 6.5).rightSpaceToView(self.buyRulesBackgroundView, 6.5).autoHeightRatio(0);


        [self.buyRulesBackgroundView addSubview:self.refundRulesLabel];
        self.refundRulesLabel.sd_layout.leftSpaceToView(self.buyRulesBackgroundView, 6.5).topSpaceToView(self.buyTimeLabel, 6.5).rightSpaceToView(self.buyRulesBackgroundView, 6.5).autoHeightRatio(0);
        
        
        [self.contentView addSubview:self.buyCountTitleLabel];
        self.buyCountTitleLabel.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.buyRulesBackgroundView, MARGIN_20).widthIs(200).heightIs(MARGIN_15);
//
//
        [self.contentView addSubview:self.stepper];
        self.stepper.sd_layout.rightSpaceToView(self.contentView, MARGIN_15).centerYEqualToView(self.buyCountTitleLabel).widthIs(115).heightIs(35);
//
//
        [self.contentView addSubview:self.buyCountRulesBackgroundView];
        self.buyCountRulesBackgroundView.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.buyCountTitleLabel, 23.5).rightSpaceToView(self.contentView, MARGIN_15);
        [self.buyCountRulesBackgroundView setupAutoHeightWithBottomView:self.buyCountRulesLabel bottomMargin:6.5];
        

        [self.buyCountRulesBackgroundView addSubview:self.buyCountRulesLabel];
        self.buyCountRulesLabel.sd_layout.leftSpaceToView(self.buyCountRulesBackgroundView, 6.5).topSpaceToView(self.buyCountRulesBackgroundView, 6.5).rightSpaceToView(self.buyCountRulesBackgroundView, 6.5).autoHeightRatio(0);


        [self.contentView addSubview:self.bottomGrayLineView];
        self.bottomGrayLineView.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.buyCountRulesBackgroundView, 17.5).rightSpaceToView(self.contentView, 0).heightIs(5);
//
//
        [self.contentView addSubview:self.visitorInfoTitleLabel];
        self.visitorInfoTitleLabel.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.bottomGrayLineView, 21.5).rightSpaceToView(self.contentView, MARGIN_15).heightIs(17);
        
        
        
        [self setupAutoHeightWithBottomView:self.visitorInfoTitleLabel bottomMargin:MARGIN_10];
        
    }
    return self;
}



@end
