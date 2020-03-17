//
//  NSObject+SLModel.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 16/8/16.
//  Copyright © 2016年 CoderSLZeng. All rights reserved.
//  Runtime(字典转模型)(二级转换)

#import <Foundation/Foundation.h>

@interface NSObject (SLModel)

/**
 *  字典转模型
 *
 *  @param dict 字典
 *
 *  @return 模型
 */
+ (__kindof NSObject *)sl_modelWithDict:(NSDictionary *)dict;

@end
