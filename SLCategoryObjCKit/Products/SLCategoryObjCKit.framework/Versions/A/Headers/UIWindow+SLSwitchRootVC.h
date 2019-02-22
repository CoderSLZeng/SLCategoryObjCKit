//
//  UIWindow+SLSwitchRootVC.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/20.
//  通过版本号判断是否更新了app，切换根控制器
//

#import <UIKit/UIKit.h>

@interface UIWindow (SLSwitchRootVC)

/**
 *  切换window的根控制器
 *
 *  @return 根控制器
 */
- (instancetype)sl_switchRootViewController;

@end
