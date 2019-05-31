//
//  NSString+SLExtension.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2010/10/27.
//  
//

#import "NSString+SLExtension.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SLExtension)

+ (BOOL)sl_isValiMobile:(NSString *)mobile
{
    
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    
    NSString *CM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186,145,176,1709
     */
    NSString *CU = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    
    /**
     * 中国电信：China Telecom
     * 133,1349,153,177,180,181,189,177,1700
    */
    NSString *CT = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    // NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if (([regextestmobile evaluateWithObject:mobile] == YES)
       || ([regextestcm evaluateWithObject:mobile] == YES)
       || ([regextestct evaluateWithObject:mobile] == YES)
       || ([regextestcu evaluateWithObject:mobile] == YES)) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)sl_isValidIDCardNumber:(NSString *)IDCardNumber
{
    
    if (IDCardNumber.length != 18) return NO;
    // 正则表达式判断基本 身份证号是否满足格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    // 如果通过该验证，说明身份证格式正确，但准确性还需计算
    if (![identityStringPredicate evaluateWithObject:IDCardNumber]) return NO;
    
    //** 开始进行校验 *//
    
    // 将前17位加权因子保存在数组里
    NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
    
    // 这是除以11后，可能产生的11位余数、验证码，也保存成数组
    NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
    
    // 用来保存前17位各自乖以加权因子后的总和
    NSInteger idCardWiSum = 0;
    for (int i = 0; i < 17; i++) {
        NSInteger subStrIndex = [[IDCardNumber substringWithRange:NSMakeRange(i, 1)] integerValue];
        NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
        idCardWiSum+= subStrIndex * idCardWiIndex;
    }
    
    // 计算出校验码所在数组的位置
    NSInteger idCardMod=idCardWiSum%11;
    // 得到最后一位身份证号码
    NSString *idCardLast= [IDCardNumber substringWithRange:NSMakeRange(17, 1)];
    // 如果等于2，则说明校验码是10，身份证号码最后一位应该是X
    if (idCardMod == 2) {
        if (![idCardLast isEqualToString:@"X"] || [idCardLast isEqualToString:@"x"]) return NO;
    } else {
        // 用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
        if (![idCardLast isEqualToString:[idCardYArray objectAtIndex:idCardMod]]) return NO;
    }
    return YES;
}

+ (BOOL)sl_isValidCarID:(NSString *)carID
{
    if (carID.length != 7) return NO;
    
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-hj-zA-HJ-Z]{1}[a-hj-zA-HJ-Z_0-9]{4}[a-hj-zA-HJ-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:carID];
}

+ (BOOL)sl_isValidNum:(NSString *)num
{
    NSScanner *scan = [NSScanner scannerWithString:num];
    float val;
    BOOL isOK = [scan scanFloat:&val] && [scan isAtEnd];
    return isOK;
}

+ (NSString *)sl_stringByReplacingNullValueWithString:(NSString *)str
{
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];// 换行
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""]; // 空格
    return str;
}

+ (nullable NSString *)sl_getDateWithTimeStamp:(nullable NSString *)timeStampStr
{
    if (0 == timeStampStr.length || ![self sl_isValidNum:timeStampStr]) {
        NSException *excp = [NSException exceptionWithName:@"pathError"
                                                    reason:@"调用此方法必须提供一个有效的【时间戳】参数"
                                                  userInfo:nil];
        [excp raise];
        return nil;
    }
    
    NSTimeInterval interval = [timeStampStr doubleValue];
    
    interval = timeStampStr.length == 13 ? interval / 1000 : interval;
    
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString       = [formatter stringFromDate:date];
    return dateString;
}

+ (nullable NSString *)sl_getDateWithDateFormat:(nonnull NSString *)fmt
{
    if (0 == fmt.length || [self sl_isValidNum:fmt]) {
        NSException *excp = [NSException exceptionWithName:@"pathError"
                                                    reason:@"调用此方法必须提供一个有效的【指定时间格式】参数"
                                                  userInfo:nil];
        [excp raise];
        return nil;
    }
    
    // 获取当前时间
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:fmt];
    NSString *dateString       = [formatter stringFromDate:date];
    return dateString;
}

+ (nullable NSString *)sl_getDetailDateWithTimeStamp:(nonnull NSString *)timeStampStr
{
    if (0 == timeStampStr.length || ![self sl_isValidNum:timeStampStr]) {
        
        NSException *excp = [NSException exceptionWithName:@"pathError"
                                                    reason:@"调用此方法必须提供一个有效的【时间戳】参数"
                                                  userInfo:nil];
        [excp raise];
        return nil;
    }
    
    // timeStampStr 是服务器返回的13位时间戳
    // iOS 生成的时间戳是10位
    NSTimeInterval interval = [timeStampStr doubleValue];
    interval = timeStampStr.length == 13 ? interval / 1000 : interval;
    
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}

+ (nullable NSString *)sl_getDetailDateWithTimeStamp:(nullable NSString *)timeStampStr dateFormat:(nullable NSString *)fmt;
{
    if (0 == timeStampStr.length || ![self sl_isValidNum:timeStampStr]) {
        
        NSException *excp = [NSException exceptionWithName:@"pathError"
                                                    reason:@"调用此方法必须提供一个有效的【时间戳】参数"
                                                  userInfo:nil];
        [excp raise];
        return nil;
    }
    
    if (0 == fmt.length || [self sl_isValidNum:timeStampStr]) {
        NSException *excp = [NSException exceptionWithName:@"pathError"
                                                    reason:@"调用此方法必须提供一个有效的【指定时间格式】参数"
                                                  userInfo:nil];
        [excp raise];
        return nil;
    }
    
    // timeStampStr 是服务器返回的13位时间戳
    // iOS 生成的时间戳是10位
    NSTimeInterval interval = [timeStampStr doubleValue];
    interval = timeStampStr.length == 13 ? interval / 1000 : interval;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:fmt];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}

+ (NSString *)sl_currentDate
{
    return [self sl_getDateWithDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)sl_currentYear {
    return [self sl_getDateWithDateFormat:@"yyyy"];
}

+ (NSString *)sl_currentMonth {
    return [self sl_getDateWithDateFormat:@"MM"];
}

+ (NSString *)sl_currentDay {
    return [self sl_getDateWithDateFormat:@"dd"];
}

+ (nonnull NSString *)sl_getNowTimeTimeStamp2Second {
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval second =[date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.f", second];//转为字符型
    return timeString;
    
}

+ (nonnull NSString *)sl_getNowTimeTimeStamp2Millisecond {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"];
    
    // 设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate *nowDate = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[nowDate timeIntervalSince1970] * 1000];
    
    return timeSp;
}

- (NSString *)sl_removeForeAndAftSpaceString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)sl_dateStringAfterlocalDateForYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minute:(NSInteger)minute Second:(NSInteger)second
{
    // 将有效日期字符串转换成日期格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]]; // 设置时区
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *localDate = [formatter dateFromString:self];
    
    // 在当前日期时间加上 时间：格里高利历
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponent = [[NSDateComponents alloc] init];
    
    [offsetComponent setYear:year ];  // 设置开始时间为当前时间的前x年
    [offsetComponent setMonth:month];
    [offsetComponent setDay:day];
    [offsetComponent setHour:(hour)];
    [offsetComponent setMinute:minute];
    [offsetComponent setSecond:second];
    // 当前时间后若干时间
    NSDate *minDate = [gregorian dateByAddingComponents:offsetComponent toDate:localDate options:0];
    
    NSString *dateString = [NSString stringWithFormat:@"%@", minDate];
    
    return dateString;
}

- (NSString *)sl_substringToIndexWithTimeZone
{
    // 截取字符串开始位置
    NSUInteger length = [self rangeOfString:@"+"].location - 1;
    // 截取时间中小时字符
    NSString *str = [self substringToIndex:length];
    NSLog(@"str:%@",str);
    
    return str;
}

- (CGSize)sl_sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sl_sizeWithFont:(UIFont *)font
{
    return [self sl_sizeWithFont:font maxW:MAXFLOAT];
}


- (NSString *)sl_replacIgnoreString4HTMLSourceCode
{
    if (!self.length) return nil;
    // 需要替换的字符串
    NSString *ignoreStr = @"&amp;tp=webp&amp;wxfrom=5&amp;wx_lazy=1\"";
    // 如果不包含，就返回
    if (![self containsString:ignoreStr]) return self;
    
    return [self stringByReplacingOccurrencesOfString:ignoreStr withString:@"\""];
}

- (NSString *)sl_htmlEntityDecode
{
    NSString *string = self;
    NSString *ignoreStr = @"&amp;tp=webp&amp;wxfrom=5&amp;wx_lazy=1\"";
    string = [string stringByReplacingOccurrencesOfString:ignoreStr withString:@"\""];
    string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    string = [string stringByReplacingOccurrencesOfString:@"&ldquo;" withString:@"“"];
    string = [string stringByReplacingOccurrencesOfString:@"&rdquo;" withString:@"”"];
    string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    
    return string;
}

- (NSAttributedString *)sl_attributedStringFromHTMLString
{
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                               NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [[NSAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
}

- (NSString *)sl_filterHTML
{
    NSString *html;
    NSScanner *scanner = [NSScanner scannerWithString:html];
    NSString *text = nil;
    while([scanner isAtEnd] == NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [self stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}

- (NSArray *)sl_componentsSeparatedFromString:(NSString *)fromString toString:(NSString *)toString
{
    if (!fromString || !toString || fromString.length == 0 || toString.length == 0) {
        return nil;
    }
    NSMutableArray *subStringsArray = [[NSMutableArray alloc] init];
    NSString *tempString = self;
    NSRange range = [tempString rangeOfString:fromString];
    while (range.location != NSNotFound) {
        tempString = [tempString substringFromIndex:(range.location + range.length)];
        range = [tempString rangeOfString:toString];
        if (range.location != NSNotFound) {
            [subStringsArray addObject:[tempString substringToIndex:range.location]];
            range = [tempString rangeOfString:fromString];
        } else {
            break;
        }
    }
    return subStringsArray;
}

- (NSString *)sl_md5 {
    const char *data = self.UTF8String;
    int count = CC_MD5_DIGEST_LENGTH;
    unsigned char md5[count];
    // 把C语言的字符串 -> md5 c字符串
    CC_MD5(data, (CC_LONG)strlen(data), md5);

    NSMutableString *result = [NSMutableString stringWithCapacity:count << 1];
    for (int i = 0; i < count; i++) {
        [result appendFormat:@"%02x", md5[i]];
    }
    return result;
}

@end
