//
//  NSMutableArray+SLExtension.m
//  SLCategoryObjCKit_Example
//
//  Created by CoderSLZeng on 2019/3/7.
//  Copyright © 2019 CoderSLZeng. All rights reserved.
//

#import "NSMutableArray+SLExtension.h"

#import <objc/runtime.h>

@implementation NSMutableArray (SLExtension)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class cls = NSClassFromString(@"__NSArrayM");
        Method method1 = class_getInstanceMethod(cls, @selector(insertObject:atIndex:));
        Method method2 = class_getInstanceMethod(cls, @selector(sl_insertObject:atIndex:));
        
        method_exchangeImplementations(method1, method2);
    });
}


/**
 交换方法实现

 @param anObject 对象
 @param index 下标
 */
- (void)sl_insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if (anObject == nil) return;
    
    [self sl_insertObject:anObject atIndex:index];
}

@end
