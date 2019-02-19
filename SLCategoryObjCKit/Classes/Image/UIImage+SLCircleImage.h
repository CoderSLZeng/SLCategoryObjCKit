//
//  UIImage+SLCircleImage.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/22.
//  绘制图片

#import <UIKit/UIKit.h>

@interface UIImage (SLCircleImage)

/**
 *  圆形的图标
 */
- (instancetype)sl_circleImage;

/**
 *  根据一个图标的名字返回一个没有被渲染的的图标
 *
 *  @param imageName 图标的名字
 *
 *  @return 没有被渲染的的图标
 */

/**
 根据一个图标的名字返回一个没有被渲染的的图标

 @param imageName 图标的名字
 @return 没有被渲染的的图标
 */
+ (instancetype)sl_imageOriginalWithImageNamed:(NSString *)imageName;

/**
 根据一个图标的名字返回一个没有被渲染的的图标
 
 @param aClass    所在Bundle的类
 @param imageName 图标的名字
 @return 没有被渲染的的图标
 */
+(instancetype)sl_imageOriginalWithBundleForClass:(Class)aClass imageNamed:(NSString *)imageName;

/**
 *  根据一个图标的名字返回一个圆形的图标
 *
 *  @param imageName 图标的名字
 *
 *  @return 圆形的图标
 */
+ (instancetype)sl_circleImageNamed:(NSString *)imageName;

/**
 根据一个图标的名字返回一个圆形的图标
 
 @param aClass 所在Bundle的类
 @param imageName 图标的名字
 @return 圆形的图标
 */
+ (instancetype)sl_circleWithBundleForClass:(Class)aClass ImageNamed:(NSString *)imageName;

@end
