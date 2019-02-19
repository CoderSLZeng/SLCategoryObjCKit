//
//  UIImage+SLImageWithBundlePath.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/23.
//

#import "UIImage+SLImageWithBundlePath.h"

@implementation UIImage (SLImageWithBundlePath)
+ (UIImage *)sl_imageWithBundleForClass:(Class)aClass imageNamed:(NSString *)imageName;
{
    if (!aClass) return nil;
    if (!imageName.length) return nil;
    
    NSBundle *currentBundle = [NSBundle bundleForClass:aClass];
    NSString *bundleName = [currentBundle.infoDictionary[@"CFBundleName"] stringByAppendingString:@".bundle"];
    NSString *imagePath = [currentBundle pathForResource:imageName ofType:nil inDirectory:bundleName];
    return [UIImage imageWithContentsOfFile:imagePath];
}
@end
