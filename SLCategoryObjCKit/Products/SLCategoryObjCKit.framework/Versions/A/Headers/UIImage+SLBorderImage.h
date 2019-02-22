//
//  UIImage+SLBorderImage.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/22.
//  带有边框的圆形图片裁剪
//

#import <UIKit/UIKit.h>

@interface UIImage (SLBorderImage)

/**
 *  生成一张带有边框的圆形图片
 *
 *  @param borderW     边框宽度
 *  @param borderColor 边框颜色
 *  @param image       要添加边框的图片
 *
 *  @return 生成的带有边框的圆形图片
 */
+ (UIImage *)sl_imageWithBorder:(CGFloat)borderW color:(UIColor *)borderColor image:(UIImage *)image;

@end
