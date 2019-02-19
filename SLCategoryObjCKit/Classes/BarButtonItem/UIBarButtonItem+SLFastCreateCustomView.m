//
//  UIBarButtonItem+SLFastCreateCustomView.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/22.
//

#import "UIBarButtonItem+SLFastCreateCustomView.h"

@implementation UIBarButtonItem (SLExtension)

#pragma mark - Public interface
+ (instancetype)sl_itemWithImageNamed:(NSString *)norImageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action
{
    if (!norImageName.length) return nil;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [button sizeToFit];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)sl_itemWithBundleForClass:(Class)aClass imageNamed:(NSString *)norImageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action
{
    if (!aClass) return nil;
    if (!norImageName.length) return nil;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[self sl_imageWithBundleForClass:aClass imageNamed:norImageName] forState:UIControlStateNormal];
    [button setImage:[self sl_imageWithBundleForClass:aClass imageNamed:highImageName] forState:UIControlStateHighlighted];
    [button sizeToFit];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
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
