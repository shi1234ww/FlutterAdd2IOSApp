//
//  BaseView.m
//  Seed
//
//  Created by shi1234ww on 2020/10/5.
//  Copyright © 2020 introtec. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = HEXCOLOR(0xFFFFFF);
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = HEXCOLOR(0xFFFFFF);
}

@end
