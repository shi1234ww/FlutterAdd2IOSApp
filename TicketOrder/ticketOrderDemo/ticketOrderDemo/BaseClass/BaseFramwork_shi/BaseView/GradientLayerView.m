//
//  GradientLayerView.m
//  Seed
//
//  Created by shi1234ww on 2020/10/8.
//  Copyright © 2020 introtec. All rights reserved.
//

#import "GradientLayerView.h"

@implementation GradientLayerView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

#pragma mark getter
+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (NSArray *)colors {
    return ((CAGradientLayer *)self.layer).colors;
}

- (NSArray<NSNumber *> *)locations {
    return ((CAGradientLayer *)self.layer).locations;
}

- (CGPoint)startPoint {
    return ((CAGradientLayer *)self.layer).startPoint;
}

- (CGPoint)endPoint {
    return ((CAGradientLayer *)self.layer).endPoint;
}

- (CAGradientLayerType)type {
    return ((CAGradientLayer *)self.layer).type;
}

#pragma mark setter
- (void)setColors:(NSArray *)colors {
    ((CAGradientLayer *)self.layer).colors = colors;
}

- (void)setLocations:(NSArray<NSNumber *> *)locations {
    ((CAGradientLayer *)self.layer).locations = locations;
}

- (void)setStartPoint:(CGPoint)startPoint {
    ((CAGradientLayer *)self.layer).startPoint = startPoint;
}

- (void)setEndPoint:(CGPoint)endPoint {
    ((CAGradientLayer *)self.layer).endPoint = endPoint;
}

- (void)setType:(CAGradientLayerType)type {
    ((CAGradientLayer *)self.layer).type = type;
}

@end
