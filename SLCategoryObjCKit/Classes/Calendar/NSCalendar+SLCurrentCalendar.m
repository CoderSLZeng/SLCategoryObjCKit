//
//  NSCalendar+SLCurrentCalendar.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/22.
//

#import "NSCalendar+SLCurrentCalendar.h"

@implementation NSCalendar (SLCurrentCalendar)

+ (instancetype)sl_calendar
{
    if ([NSCalendar instancesRespondToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        return [NSCalendar currentCalendar];
    }
}

@end
