//
//  UITabBarController+SLAddChildVC.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 16/8/16.
//  Copyright © 2016年 CoderSLZeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (SLAddChildVC)
/**
 *  添加子控制器
 *
 *  @param childController 子控制器
 *  @param image           图标
 *  @param selectedImage   选中的图标
 *  @param title           标题
 */
- (void)sl_addChildViewController:(UIViewController *)childController image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title;
@end
