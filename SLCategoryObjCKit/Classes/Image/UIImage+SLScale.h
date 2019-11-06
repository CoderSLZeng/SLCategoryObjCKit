//
//  UIImage+SLScale.h
//  PartyConstruction
//
//  Created by CoderSLZeng on 2018/1/30.
//  压缩图片
//

#import <UIKit/UIKit.h>

@interface UIImage (SLScale)

/**
 通过指定大小压缩图片

 @param size 指定大小
 @return 缩放后的图片
 */
- (UIImage *)sl_imageCompressWithScaledToSize:(CGSize)size;

/**
 通过指定缩放系数压缩图片
 
 @param scale 指定缩放系数
 @return 压缩后的图片
 */
- (UIImage *)sl_imageCompressWithScale:(float)scale;

/**
 通过计算得到缩放系数压缩图片
 
 @param targetSize 指定大小
 @return 缩放后的图片
 */
- (UIImage *)sl_imageByScalingAndCroppingForSize:(CGSize)targetSize;

/**
 返回一个可拉伸的图片
 */
- (UIImage *)sl_resizableImage;
@end
