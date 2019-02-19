//
//  UIImage+SLImageWithBundlePath.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/23.
//

#import <UIKit/UIKit.h>

@interface UIImage (SLImageWithBundlePath)

/**
 根据所在Bundle类获取图片

 @param aClass 所在Bundle的类
 @param imageName 图片名字
 */
+ (UIImage *)sl_imageWithBundleForClass:(Class)aClass imageNamed:(NSString *)imageName;
@end
