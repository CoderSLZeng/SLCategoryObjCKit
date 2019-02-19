//
//  UIWindow+SLSwitchRootVC.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/22.
//

#import "UIWindow+SLSwitchRootVC.h"

@implementation UIWindow (SLSwitchRootVC)

/**
 *  切换window的根控制器
 *
 *  @return 根控制器
 */
- (instancetype)sl_switchRootViewController
{
    // app的版本号键
    NSString *key = @"CFBundleVersion";
    
    // 获取之前版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    // 获取当前的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    // 判断版本号
    if ([currentVersion isEqualToString:lastVersion]) {
        // TODO: 根据自己的需求更改要切换的根控制器
        UITabBarController *tabBarVC = [[UITabBarController alloc] init];
        self.rootViewController = tabBarVC;
    } else {
        UITableViewController *tableVC = [[UITableViewController alloc] init];
        self.rootViewController = tableVC;
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return self;
    
}
@end
