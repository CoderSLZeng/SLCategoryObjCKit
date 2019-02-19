//
//  UIColor+SLExtension.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2018/11/8.
//  
//

#import "UIColor+SLExtension.h"

@implementation UIColor (SLExtension)
+ (UIColor *)sl_randomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}

+ (instancetype)sl_r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b alphaComponent:(CGFloat)alpha {
     return [[self sl_r:r g:g b:b] colorWithAlphaComponent:alpha];
}

+ (instancetype)sl_r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b {
    return [self sl_r:r g:g b:b a:0xff];
}

+ (instancetype)sl_r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b a:(uint8_t)a {
    
    return [self colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a / 255.0f];
}

+ (instancetype)sl_rgba:(NSUInteger)rgba {
    return [self sl_r:(rgba >> 24)&0xFF g:(rgba >> 16)&0xFF b:(rgba >> 8)&0xFF a:rgba&0xFF];
}

+ (instancetype)sl_colorWithHexString:(NSString*)hexString {
    if (!hexString)
        return nil;
    
    NSString* hex = [NSString stringWithString:hexString];
    if ([hex hasPrefix:@"#"])
        hex = [hex substringFromIndex:1];
    
    if (hex.length == 6)
        hex = [hex stringByAppendingString:@"FF"];
    else if (hex.length != 8)
        return nil;
    
    uint32_t rgba;
    NSScanner* scanner = [NSScanner scannerWithString:hex];
    [scanner scanHexInt:&rgba];
    return [UIColor sl_rgba:rgba];
}

- (NSUInteger)sl_rgbaValue {
    CGFloat r, g, b, a;
    if ([self getRed:&r green:&g blue:&b alpha:&a]) {
        NSUInteger rr = (NSUInteger)(r * 255 + 0.5);
        NSUInteger gg = (NSUInteger)(g * 255 + 0.5);
        NSUInteger bb = (NSUInteger)(b * 255 + 0.5);
        NSUInteger aa = (NSUInteger)(a * 255 + 0.5);
        
        return (rr << 24) | (gg << 16) | (bb << 8) | aa;
    } else {
        return 0;
    }
}
@end
