//
//  NSDate+SLExtension.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/27.
//  判断当前时间的分类方法的声明
//

#import <Foundation/Foundation.h>

@interface NSDate (SLExtension)

/**
 *  判断是否为今年
 */
- (BOOL)sl_isThisYear;

/**
 *  判断是否为昨天
 */
- (BOOL)sl_isYesterday;

/**
 *  判断是否为今天
 */
- (BOOL)sl_isToday;

/**
 *  判断是否为明天
 */
- (BOOL)sl_isTomorrow;

/**
 将时间字符串转换成时间格式
 
 @param dateString 时间字符串
 */
+ (NSDate *)sl_convertDateFromString:(NSString*)dateString;

@end
