//
//  UIButton+SLExtension.m
//  PartyConstruction
//
//  Created by CoderSLZeng on 2018/9/26.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "UIButton+SLExtension.h"

@implementation UIButton (SLExtension)

- (void)sl_customLayerWithBorderColor:(UIColor *)color borderWidth:(CGFloat)width cornerRadius:(CGFloat)radius {
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
    self.layer.cornerRadius = radius;
}

@end
