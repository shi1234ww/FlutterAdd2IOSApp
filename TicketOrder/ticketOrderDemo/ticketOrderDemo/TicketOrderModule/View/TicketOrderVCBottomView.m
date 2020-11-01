//
//  TicketOrderVCBottomView.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/30.
//

#import "TicketOrderVCBottomView.h"

@interface TicketOrderVCBottomView ()
@property(nonatomic, strong) UIView *lineView1;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *priceLabel;
@property(nonatomic, strong) UIView *orderBackgroundView;
@property(nonatomic, strong) UILabel *orderLabel;
@end

@implementation TicketOrderVCBottomView

-(UIView *)lineView1{
    if (!_lineView1) {
        _lineView1 = [[UIView alloc] init];
        _lineView1.backgroundColor = HEXCOLOR_LineColor_Gray_F5F5F5;
    }
    return _lineView1;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = HEXCOLOR_TextColor_Black;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.text = @"在线支付:";
    }
    return _titleLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = HEXCOLOR(0xF15252);
        _priceLabel.font = [UIFont systemFontOfSize:16];
        _priceLabel.text = @"¥100.00";
    }
    return _priceLabel;
}

-(UIView *)orderBackgroundView{
    if (!_orderBackgroundView) {
        _orderBackgroundView = [[UIView alloc] init];
        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame = CGRectMake(0,0,150,50);
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1, 1);
        gl.colors = @[(__bridge id)[UIColor colorWithRed:252/255.0 green:74/255.0 blue:124/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:255/255.0 green:84/255.0 blue:17/255.0 alpha:1.0].CGColor];
        gl.locations = @[@(0.0),@(1.0f)];

        [_orderBackgroundView.layer addSublayer:gl];
        _orderBackgroundView.layer.shadowColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:215/255.0 alpha:1.0].CGColor;
        _orderBackgroundView.layer.shadowOffset = CGSizeMake(0,0);
        _orderBackgroundView.layer.shadowOpacity = 1;
        _orderBackgroundView.layer.shadowRadius = 0;

    }
    return _orderBackgroundView;
}


- (UILabel *)orderLabel{
    if (!_orderLabel) {
        _orderLabel = [[UILabel alloc] init];
        _orderLabel.textColor = HEXCOLOR(0xFFFFFF);
        _orderLabel.font = [UIFont systemFontOfSize:16];
        _orderLabel.text = @"立即预订";
        _orderLabel.textAlignment = NSTextAlignmentCenter;
        _orderLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(orderLabelTap)];
        [_orderLabel addGestureRecognizer:tap];
    }
    return _orderLabel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineView1];
        self.lineView1.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(DEFAULT_LINE_HEIGHT);
        
        
        [self addSubview:self.orderBackgroundView];
        self.orderBackgroundView.sd_layout.topSpaceToView(self.lineView1, 0).rightSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(150);
        
        
        [self.orderBackgroundView addSubview:self.orderLabel];
        self.orderLabel.sd_layout.centerXEqualToView(self.orderBackgroundView).centerYEqualToView(self.orderBackgroundView).widthRatioToView(self.orderBackgroundView, 1).heightRatioToView(self.orderBackgroundView, 1);


        [self addSubview:self.titleLabel];
        self.titleLabel.sd_layout.leftSpaceToView(self, MARGIN_15).topSpaceToView(self, 0 ).bottomSpaceToView(self, 0).widthIs(70);

        [self addSubview:self.priceLabel];
        self.priceLabel.sd_layout.leftSpaceToView(self.titleLabel, MARGIN_10).topSpaceToView(self, 0).bottomSpaceToView(self, 0).rightSpaceToView(self.orderBackgroundView, 0);
        
        
    }
    return self;
}



- (void)orderLabelTap{
    if (self.delegate && [self.delegate respondsToSelector:@selector(orderLabelDidTap)]) {
        [self.delegate orderLabelDidTap];
    }
}

@end
