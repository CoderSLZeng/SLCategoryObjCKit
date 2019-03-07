//
//  NSMutableDictionary+SLExtension.m
//  SLCategoryObjCKit_Example
//
//  Created by CoderSLZeng on 2019/3/7.
//  Copyright © 2019 CoderSLZeng. All rights reserved.
//

#import "NSMutableDictionary+SLExtension.h"

#import <objc/runtime.h>

@implementation NSMutableDictionary (SLExtension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class cls1 = NSClassFromString(@"__NSDictionaryM");
        
        Method m1 = class_getInstanceMethod(cls1, @selector(setObject:forKeyedSubscript:));
        Method m2 = class_getInstanceMethod(cls1, @selector(sl_setObject:forKeyedSubscript:));

        method_exchangeImplementations(m1, m2);
        
        Class cls2 = NSClassFromString(@"__NSDictionaryI");
        
        Method m3 = class_getInstanceMethod(cls2, @selector(objectForKeyedSubscript:));
        Method m4 = class_getInstanceMethod(cls2, @selector(sl_objectForKeyedSubscript:));
        
        method_exchangeImplementations(m3, m4);
        
    });
}

- (void)sl_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    
    if (key == nil) return;
    
    [self sl_setObject:obj forKeyedSubscript:key];
}

- (id)sl_objectForKeyedSubscript:(id)key {
    
    if (key == nil) return nil;
    
    return [self sl_objectForKeyedSubscript:key];
}


@end
