//
//  Foundation+Log.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2019/1/15.
//

#import <Foundation/Foundation.h>

@implementation NSDictionary (Log)

-(NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *string = [NSMutableString string];
    
    [string appendString:@"{"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [string appendFormat:@"%@:", key];
        [string appendFormat:@"%@,", obj];
    }];
    
    [string appendString:@"}"];

    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        [string deleteCharactersInRange:range];
    }
    
    return string;
}

@end

@implementation NSArray (Log)

-(NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *string = [NSMutableString string];
    
    [string appendString:@"["];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [string appendFormat:@"%@,\n", obj];
    }];

    [string appendString:@"]"];
    
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        [string deleteCharactersInRange:range];
    }

    return string;
}
@end
