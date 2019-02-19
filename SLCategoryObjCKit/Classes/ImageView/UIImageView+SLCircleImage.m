//
//  UIImageView+SLCircleImage.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/27.
//

#import "UIImageView+SLCircleImage.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (SLCircleImage)
#pragma mark - Public interface
- (void)sl_setCircleImageWithURLString:(NSString *)urlStr placeholderImageNamed:(NSString *)imageName
{
    if (!imageName.length) return;

    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[self sl_circleImageNamed:imageName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return;
        
        self.image = [self sl_circleImage];
    }];
}

- (void)sl_setCircleImageWithBundleForClass:(Class)aClass URLString:(NSString *)urlStr placeholderImageNamed:(NSString *)imageName
{
    if (!aClass) return;
    if (!imageName.length) return;
    
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[self sl_imageWithBundleForClass:aClass imageNamed:imageName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!image) return;
        
        self.image = [self sl_circleImage];
    }];
}

- (void)sl_setRectImageWithURLString:(NSString *)urlStr placeholderImageNamed:(NSString *)imageName
{
    if (!urlStr.length) return;
    if (!imageName.length) return;
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:imageName]];
}

- (void)sl_setRectImageWithBundleForClass:(Class)aClass URLString:(NSString *)urlStr placeholderImageNamed:(NSString *)imageName
{
    if (!aClass) return;
    if (!urlStr.length) return;
    if (!imageName.length) return;
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[self sl_imageWithBundleForClass:aClass imageNamed:imageName]];
}

#pragma mark - Private method
- (UIImage *)sl_circleImage
{
    // 开始图形上下文
    UIGraphicsBeginImageContext(self.image.size);
    
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 绘制
    [self.image drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)sl_circleImageNamed:(NSString *)imageName
{
    if (!imageName.length) return nil;
    self.image = [UIImage imageNamed:imageName];
    return [self sl_circleImage];
}

- (UIImage *)sl_imageWithBundleForClass:(Class)aClass imageNamed:(NSString *)imageName
{
    if (!aClass) return nil;
    if (!imageName.length) return nil;
    
    NSBundle *currentBundle = [NSBundle bundleForClass:aClass];
    NSString *bundleName = [currentBundle.infoDictionary[@"CFBundleName"] stringByAppendingString:@".bundle"];
    NSString *imagePath = [currentBundle pathForResource:imageName ofType:nil inDirectory:bundleName];
    return [UIImage imageWithContentsOfFile:imagePath];
}
@end
