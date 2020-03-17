//
//  NSObject+SLModel.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 16/8/16.
//  Copyright © 2016年 CoderSLZeng. All rights reserved.
//  Runtime(字典转模型)(二级转换)

#import "NSObject+Model.h"
#import <objc/message.h>

@implementation NSObject (SLModel)

/**
 *  字典转模型
 *
 *  @param dict 字典
 *
 *  @return 模型
 */
+ (NSObject *)sl_modelWithDict:(NSDictionary *)dict
{
    id objc = [[self alloc] init];
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        
        NSString *propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        NSString *propertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        NSString *key = [propertyName substringFromIndex:1];
        
        id value = dict[key];
        
        if ([value isKindOfClass:[NSDictionary class]] && ![propertyType containsString:@"NS"]) {
            NSRange range = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringFromIndex:range.location + range.length];
            
            range = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringFromIndex:range.location];
            
            Class modelClass = NSClassFromString(propertyType);
            
            if (modelClass) {
                value = [modelClass modelWithDict:value];
            }
        }
        
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    
    free(ivarList);
    
    return objc;
}

@end
