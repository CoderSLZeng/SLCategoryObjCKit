//
//  UIColor+SLExtension.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2018/11/8.
//  获取自定义颜色
//

#import <UIKit/UIKit.h>

@interface UIColor (SLExtension)

/**
 创建并返回一个随机颜色对象

 @return 一个随机颜色对象
 */
+ (UIColor *)sl_randomColor;

/**
 创建并返回一个指定的 RGBA 值颜色对象

 @param r 红色
 @param g 绿色
 @param b 蓝色
 @param alpha 透明度
 @return 一个指定的 RGBA 值颜色对象
 */
+ (instancetype)sl_r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b alphaComponent:(CGFloat)alpha;

/**
 创建并返回一个指定的 RGB 值颜色对象

 @param r 红色
 @param g 绿色
 @param b 蓝色
 @retrn 一个指定的 RGB 值颜色对象
 */
+ (instancetype)sl_r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b;

/**
 创建并返回一个指定的 RGBA 值颜色对象
 
 @param r 红色
 @param g 绿色
 @param b 蓝色
 @param a 透明度
 @return 一个指定的 RGBA 值颜色对象
 */
+ (instancetype)sl_r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b a:(uint8_t)a;

/**
 创建并返回一个指定的 RGB 值颜色对象
 
 @param rgba 红绿蓝透明度
 @retrn 一个指定的 RGB 值颜色对象
 */
+ (instancetype)sl_rgba:(NSUInteger)rgba;


/**
 十六进制颜色RGB数字

 @param hexString 十六进制值
 @return RGB数字颜色
 */
+ (instancetype)sl_colorWithHexString:(NSString*)hexString;


/**
 获取 RGBA 转换 Interger 值

 @return 转换后 Interger 值
 */
- (NSUInteger)sl_rgbaValue;
@end
