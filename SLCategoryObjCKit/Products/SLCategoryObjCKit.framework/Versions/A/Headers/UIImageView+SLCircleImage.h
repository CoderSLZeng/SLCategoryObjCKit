//
//  UIImageView+SLCircleImage.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/27.
//  设置圆形图标
//

#import <UIKit/UIKit.h>

@interface UIImageView (SLCircleImage)

/**
 根据一个URL路径字符串设置圆形图标

 @param urlStr 图标的URL路径字符串
 @param imageName 占位图标名字
 */
- (void)sl_setCircleImageWithURLString:(NSString *)urlStr placeholderImageNamed:(NSString *)imageName;

/**
 根据一个URL路径字符串设置圆形图标

 @param aClass 所在Bundle的类
 @param urlStr 图标的URL路径字符串
 @param imageName 占位图标名字
 */
- (void)sl_setCircleImageWithBundleForClass:(Class)aClass URLString:(NSString *)urlStr placeholderImageNamed:(NSString *)imageName;
    
/**
 根据一个URL路径字符串设置矩形的图标

 @param urlStr 图标的URL路径字符串
 @param imageName 占位图标名字
 */
- (void)sl_setRectImageWithURLString:(NSString *)urlStr placeholderImageNamed:(NSString *)imageName;

/**
 根据一个URL路径字符串设置矩形的图标

 @param aClass 所在Bundle的类
 @param urlStr 图标的URL路径字符串
 @param imageName 占位图标名字
 */
- (void)sl_setRectImageWithBundleForClass:(Class)aClass URLString:(NSString *)urlStr placeholderImageNamed:(NSString *)imageName;
@end
