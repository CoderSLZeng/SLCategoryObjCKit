//
//  UIImage+SLCreateQRCodeHDImage.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 16/9/22.
//  Copyright © 2016年 CoderSLZeng. All rights reserved.
//

#import "UIImage+SLCreateQRCodeHDImage.h"

@implementation UIImage (SLCreateQRCodeHDImage)


+ (instancetype)sl_createQRCodeHDImageFormCIImage:(CIImage *)image Size:(CGFloat)size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap
    CGFloat width = CGRectGetWidth(extent) * scale;
    CGFloat height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, 0);
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    
    return [UIImage imageWithCGImage:scaledImage];
}

@end
