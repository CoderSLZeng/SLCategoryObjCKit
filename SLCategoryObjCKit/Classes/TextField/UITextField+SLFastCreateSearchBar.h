//
//  UITextField+SLFastCreateSearchBar.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/22.
//  创建一个可以修改占位文字颜色的UITextField

#import <UIKit/UIKit.h>

@interface UITextField (SLFastCreateSearchBar)

/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *sl_placeholderColor;

/**
 *  添加一个搜索框
 *
 *  @return 搜索框
 */
+ (instancetype)sl_searchBar;

@end
