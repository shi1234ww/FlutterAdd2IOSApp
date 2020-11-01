//
//  BaseTableViewCell.m
//  Seed
//
//  Created by shi1234ww on 2020/10/8.
//  Copyright © 2020 introtec. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (UIImageView *)rightIconImageView{
    if (!_rightIconImageView) {
        _rightIconImageView = [[UIImageView alloc] init];
//        _rightArrowImg.backgroundColor= [UIColor whiteColor];
        _rightIconImageView.image = [UIImage imageNamed:self.rightIconImgName];
//
    }
    return _rightIconImageView;
}
- (UIView *)bottomLineView{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = HEXCOLOR_LineColor_Gray_F5F5F5;
    }
    return _bottomLineView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.contentView.backgroundColor = HEXCOLOR(0xFFFFFF);
        self.textLabel.textColor = HEXCOLOR(0x343434);
        
        [self.contentView addSubview:self.bottomLineView];
        self.bottomLineView.sd_layout.leftSpaceToView(self.contentView, MARGIN_20).bottomSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(DEFAULT_LINE_HEIGHT);
        [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = HEXCOLOR(0xFFFFFF);
    self.textLabel.textColor = HEXCOLOR(0x343434);
    [self.contentView addSubview:self.bottomLineView];
    self.bottomLineView.sd_layout.leftSpaceToView(self.contentView, MARGIN_20).bottomSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(DEFAULT_LINE_HEIGHT);
    [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
}

@end
