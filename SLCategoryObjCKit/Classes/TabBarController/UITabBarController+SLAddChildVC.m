//
//  UITabBarController+SLAddChildVC.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 16/8/16.
//  Copyright © 2016年 CoderSLZeng. All rights reserved.
//

#import "UITabBarController+SLAddChildVC.h"

@implementation UITabBarController (SLAddChildVC)

- (void)sl_addChildViewController:(UIViewController *)childController image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    
    // 设置图片
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 设置文字
    childController.title = title;
    self.tabBarItem.title = title;
    
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:(146)/255.0 green:(146)/255.0  blue:(146)/255.0  alpha:(255)/255.0]} forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:(9)/255.0 green:(187)/255.0  blue:(7)/255.0  alpha:(255)/255.0]} forState:UIControlStateSelected];
    
     UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}

@end
