//
//  UIImage+SLCircleImage.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/22.
//

#import "UIImage+SLCircleImage.h"

@implementation UIImage (SLCircleImage)
#pragma mark - Public interface
- (instancetype)sl_circleImage
{
    // 开始图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 绘制
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}


+ (instancetype)sl_imageOriginalWithImageNamed:(NSString *)imageName
{
    if (!imageName.length) return nil;
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

+ (instancetype)sl_imageOriginalWithBundleForClass:(Class)aClass imageNamed:(NSString *)imageName
{
    if (!aClass) return nil;
    if (!imageName.length) return nil;
    
    UIImage *image = [self sl_imageWithBundleForClass:aClass imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (instancetype)sl_circleImageNamed:(NSString *)imageName
{
    if (!imageName.length) return nil;
    return [[self imageNamed:imageName] sl_circleImage];
}

+ (instancetype)sl_circleWithBundleForClass:(Class)aClass ImageNamed:(NSString *)imageName
{
    if (!aClass) return nil;
    if (!imageName.length) return nil;
    
    return [[self sl_imageWithBundleForClass:aClass imageNamed:imageName] sl_circleImage];
}

#pragma mark - Private method
+ (UIImage *)sl_imageWithBundleForClass:(Class)aClass imageNamed:(NSString *)imageName
{
    if (!aClass) return nil;
    if (!imageName.length) return nil;
    
    NSBundle *currentBundle = [NSBundle bundleForClass:aClass];
    NSString *bundleName = [currentBundle.infoDictionary[@"CFBundleName"] stringByAppendingString:@".bundle"];
    NSString *imagePath = [currentBundle pathForResource:imageName ofType:nil inDirectory:bundleName];
    return [UIImage imageWithContentsOfFile:imagePath];
}

@end
