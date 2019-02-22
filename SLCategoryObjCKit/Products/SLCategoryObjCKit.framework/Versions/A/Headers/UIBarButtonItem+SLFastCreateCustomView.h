//
//  UIBarButtonItem+SLFastCreateCustomView.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/22.
//  快速创建UIBarButtonItem
//  

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SLFastCreateCustomView)
/**
 自定义UIBarButtonItem

 @param norImageName 普通图标
 @param highImageName 高亮图标
 @param target 监听对象
 @param action 监听方法
 @return UIBarButtonItem
 */
+ (instancetype)sl_itemWithImageNamed:(NSString *)norImageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action;
    
/**
 自定义UIBarButtonItem

 @param aClass 所在Bundle的类
 @param norImageName 图标
 @param highImageName 高亮图标
 @param target 监听对象
 @param action 监听对象
 @return 自定义UIBarButtonItem
 */
+ (instancetype)sl_itemWithBundleForClass:(Class)aClass imageNamed:(NSString *)norImageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action;

@end
