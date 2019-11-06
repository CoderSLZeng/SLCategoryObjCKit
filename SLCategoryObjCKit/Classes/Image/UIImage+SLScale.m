//
//  UIImage+SLScale.m
//  PartyConstruction
//
//  Created by CoderSLZeng on 2018/1/30.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "UIImage+SLScale.h"

@implementation UIImage (SLScale)

- (UIImage *)sl_imageCompressWithScaledToSize:(CGSize)size
{
    
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}


- (UIImage *)sl_imageCompressWithScale:(float)scale
{
    
    CGSize  size         = self.size;
    CGFloat width        = size.width;
    CGFloat height       = size.height;
    CGFloat scaledWidth  = width * scale;
    CGFloat scaledHeight = height * scale;
    
    UIGraphicsBeginImageContext(size); // this will crop
    [self drawInRect:CGRectMake(0, 0, scaledWidth, scaledHeight)];
    UIImage *newImage    = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

- (UIImage *)sl_imageByScalingAndCroppingForSize:(CGSize)targetSize
{
    UIImage *sourceImage   = self;
    UIImage *newImage      = nil;
    CGSize  imageSize      = sourceImage.size;
    CGFloat width          = imageSize.width;
    CGFloat height         = imageSize.height;
    CGFloat targetWidth    = targetSize.width;
    CGFloat targetHeight   = targetSize.height;
    CGFloat scaleFactor    = 0.0;
    CGFloat scaledWidth    = targetWidth;
    CGFloat scaledHeight   = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor  = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(targetSize); // this will crop
    
    CGRect thumbnailRect      = CGRectZero;
    thumbnailRect.origin      = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)sl_resizableImage
{
    CGFloat w = self.size.width * 0.5f - 1;
    CGFloat h = self.size.height * 0.5f - 1;
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

@end
