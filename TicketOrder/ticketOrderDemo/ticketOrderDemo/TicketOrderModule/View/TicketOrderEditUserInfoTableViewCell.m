//
//  TicketOrderEditUserInfoTableViewCell.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/28.
//

#import "TicketOrderEditUserInfoTableViewCell.h"

@interface TicketOrderEditUserInfoTableViewCell ()

@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UITextField *nameTF;

@property(nonatomic, strong) UIView *lineView1;

@property(nonatomic, strong) UITextField *phoneTF;

@property(nonatomic, strong) UIView *lineView2;

@property(nonatomic, strong) UITextField *ID_TF;


@end

@implementation TicketOrderEditUserInfoTableViewCell

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = HEXCOLOR_TextColor_Black;
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

-(UITextField *)nameTF{
    if (!_nameTF) {
        _nameTF = [[UITextField alloc] init];
        _nameTF.textColor = HEXCOLOR_TextColor_Black;
        _nameTF.placeholder = NSLocalizedString(@"请填写姓名", nil);
        _nameTF.font = [UIFont systemFontOfSize:14];
    }
    return _nameTF;
}

-(UIView *)lineView1{
    if (!_lineView1) {
        _lineView1 = [[UIView alloc] init];
        _lineView1.backgroundColor = HEXCOLOR_LineColor_Gray_F5F5F5;
    }
    return _lineView1;
}

-(UITextField *)phoneTF{
    if (!_phoneTF) {
        _phoneTF = [[UITextField alloc] init];
        _phoneTF.textColor = HEXCOLOR_TextColor_Black;
        _phoneTF.placeholder = NSLocalizedString(@"请填写手机号码", nil);
        _phoneTF.font = [UIFont systemFontOfSize:14];
    }
    return _phoneTF;
}


-(UIView *)lineView2{
    if (!_lineView2) {
        _lineView2 = [[UIView alloc] init];
        _lineView2.backgroundColor = HEXCOLOR_LineColor_Gray_F5F5F5;
    }
    return _lineView2;
}

-(UITextField *)ID_TF{
    if (!_ID_TF) {
        _ID_TF = [[UITextField alloc] init];
        _ID_TF.textColor = HEXCOLOR_TextColor_Black;
        _ID_TF.placeholder = NSLocalizedString(@"请填写证件号码", nil);
        _ID_TF.font = [UIFont systemFontOfSize:14];
    }
    return _ID_TF;
}






-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
      
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.contentView, 32.5).heightIs(50).widthIs(50);
        
        
        
        // nameTF
        [self.contentView addSubview:self.nameTF];
        self.nameTF.sd_layout.leftSpaceToView(self.titleLabel, 34.5).centerYEqualToView(self.titleLabel).rightSpaceToView(self.contentView, MARGIN_15).heightIs(50);
        
        
        [self.contentView addSubview:self.lineView1];
        self.lineView1.sd_layout.leftEqualToView(self.nameTF).topSpaceToView(self.nameTF, 0).rightSpaceToView(self.contentView, MARGIN_15).heightIs(DEFAULT_LINE_HEIGHT);
        
        
        
        
        
        // phoneTF
        [self.contentView addSubview:self.phoneTF];
        self.phoneTF.sd_layout.leftEqualToView(self.nameTF).topSpaceToView(self.lineView1, 0).rightSpaceToView(self.contentView, MARGIN_15).heightIs(50);


        [self.contentView addSubview:self.lineView2];
        self.lineView2.sd_layout.leftEqualToView(self.nameTF).topSpaceToView(self.phoneTF, 0).rightSpaceToView(self.contentView, MARGIN_15).heightIs(DEFAULT_LINE_HEIGHT);




        // 需要身份证信息
        //ID_TF
        [self.contentView addSubview:self.ID_TF];
        self.ID_TF.sd_layout.leftEqualToView(self.nameTF).topSpaceToView(self.lineView2, 0).rightSpaceToView(self.contentView, MARGIN_15).heightIs(50);
        
        
        
        [self setupAutoHeightWithBottomView:self.ID_TF bottomMargin:10];
        
        
        
        
        
        
    }
    return self;
}



-(void)setModel:(OptionModel *)model{
    
    self.titleLabel.text = [NSString stringWithFormat:@"游客%@", model.optionID];
}
@end
