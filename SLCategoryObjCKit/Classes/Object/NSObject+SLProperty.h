//
//  NSObject+SLProperty.h
// SLCategoryKit
//
//  Created by CoderSLZeng on 16/8/16.
//  Copyright © 2016年 CoderSLZeng. All rights reserved.
//  通过解析字典自动生成属性代码

#import <Foundation/Foundation.h>

@interface NSObject (SLProperty)

/**
 *  遍历字典的内容，重写property
 *
 *  @param dict 字典
 */
+ (void)sl_createPropertyCodeWithDict:(NSDictionary *)dict;

@end
