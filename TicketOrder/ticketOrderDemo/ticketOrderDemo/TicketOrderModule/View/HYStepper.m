//
//  HYStepper.m
//  HYStepper
//
//  Created by zhuxuhong on 2017/7/16.
//  Copyright © 2017年 zhuxuhong. All rights reserved.
//

#import "HYStepper.h"


@interface HYStepper()

@property(nonatomic,copy)UIButton *minusBtn;
@property(nonatomic,copy)UIButton *plusBtn;
@property(nonatomic,copy)UITextField *valueTF;

@end

@implementation HYStepper

-(instancetype)init{
    if (self = [super init]) {
        [self initData];
        
        [self setupUI];
    }
    return self;
}


-(void)initData{
    _isValueEditable = true;
    _stepValue = 1;
    _minValue = 0;
    _maxValue = 100;
    
    self.value = 1;
}

-(void)setupUI{


    self.minusBtn.frame = CGRectMake(0, 0, 35, 35);
    self.valueTF.frame = CGRectMake(35, 0, 45, 35);
    self.plusBtn.frame = CGRectMake(80, 0, 35, 35);
//
    [self addSubview: self.minusBtn];
    [self addSubview: self.valueTF];
    [self addSubview: self.plusBtn];
    
}

#pragma mark - action
-(void)actionForButtonClicked: (UIButton*)sender{
    if ([sender isEqual:_minusBtn]) {
        self.value = _value - _stepValue;
    }
    else if([sender isEqual:_plusBtn]){
        self.value = _value + _stepValue;
    }
}

-(void)actionForTextFieldEditingDidEnd: (UITextField*)sender{
    if ([sender isEqual:_valueTF]) {
        self.value = [sender.text doubleValue];
        NSLog(@"self.value :%f", self.value);
    }
}


#pragma mark - setters
-(void)setValue:(double)value{
    if (value < _minValue) {
        value = _minValue;
    }
    else if (value > _maxValue){
        value = _maxValue;
    }

    _minusBtn.enabled = value > _minValue;
    _plusBtn.enabled = value < _maxValue;
    _valueTF.text = [NSString stringWithFormat:@"%.0f",value];

    _value = value;

    _valueChanged ? _valueChanged(_value) : nil;
}

-(void)setMaxValue:(double)maxValue{
    if (maxValue < _minValue) {
        maxValue = _minValue;
    }
    _maxValue = maxValue;
}

-(void)setMinValue:(double)minValue{
    if (minValue > _maxValue) {
        minValue = _maxValue;
    }
    _minValue = minValue;
}

-(void)setIsValueEditable:(BOOL)isValueEditable{
    _isValueEditable = isValueEditable;

    _valueTF.enabled = _isValueEditable;
}

#pragma mark - private
-(UIButton*)actionButtonWithTitle: (NSString*)title{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = HEXCOLOR(0xF5F5F5);
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:HEXCOLOR(0xCBCBCB) forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(actionForButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    return btn;
}


#pragma mark - getters
-(UITextField *)valueTF{
    if (!_valueTF) {
        UITextField *tf = [UITextField new];
        tf.font = [UIFont systemFontOfSize:14];
        [tf addTarget:self action:@selector(actionForTextFieldEditingDidEnd:) forControlEvents:UIControlEventEditingDidEnd];
        tf.borderStyle = UITextBorderStyleNone;
        tf.keyboardType = UIKeyboardTypePhonePad;
        tf.textAlignment = NSTextAlignmentCenter;
        tf.enabled = self.isValueEditable;
        tf.text = [NSString stringWithFormat:@"%.0f",self.value];
        tf.textColor = HEXCOLOR(0xCBCBCB);
        _valueTF = tf;
    }
    return _valueTF;
}

-(UIButton *)minusBtn{
    if (!_minusBtn) {
        UIButton *btn = [self actionButtonWithTitle:@"-"];

        _minusBtn = btn;
    }
    return _minusBtn;
}

-(UIButton *)plusBtn{
    if (!_plusBtn) {
        UIButton *btn = [self actionButtonWithTitle:@"+"];

        _plusBtn = btn;
    }
    return _plusBtn;
}

@end
