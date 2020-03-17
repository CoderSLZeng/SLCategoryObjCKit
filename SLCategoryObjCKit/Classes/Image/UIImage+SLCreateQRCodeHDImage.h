//
//  UIImage+SLCreateQRCodeHDImage.h
//  生成高清二维码
//
//  Created by Anthony on 16/9/22.
//  Copyright © 2016年 SLZeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SLCreateQRCodeHDImage)

/**
 *  生成高清二维码图片
 *
 *  @param image 需要生成原始图片
 *  @param size  生成的高清二维码图片宽高
 *
 *  @return 高清二维码图片
 */
+ (instancetype)sl_createQRCodeHDImageFormCIImage:(CIImage *)image Size:(CGFloat)size;

@end
