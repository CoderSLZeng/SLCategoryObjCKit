//
//  NSObject+SLProperty.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 16/8/16.
//  Copyright © 2016年 CoderSLZeng. All rights reserved.
//

#import "NSObject+SLProperty.h"

@implementation NSObject (SLProperty)

/**
 *  遍历字典的内容，重写property
 *
 *  @param dict 字典
 */
+ (void)sl_createPropertyCodeWithDict:(NSDictionary *)dict
{
    NSMutableString *strM = [NSMutableString string];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *code;
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;", key];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;", key];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL *%@;", key];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;", key];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;", key];
        }
        [strM appendFormat:@"\n%@\n", code];
    }];
    
    NSLog(@"%@", strM);
}

@end
