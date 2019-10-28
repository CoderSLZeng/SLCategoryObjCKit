//
//  NSString+SLExtension.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2010/10/27.
//  NSString分类
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SLExtension)

/**
 校验是否是有效手机号码

 @param mobile 手机号码
 @return 是否是有效手机号码
 */
+ (BOOL)sl_isValiMobile:(NSString *)mobile;

/**
 校验是否是有效身份证号码

 @param IDCardNumber 身份证
 @return 是否是有效身份证号码
 */
+ (BOOL)sl_isValidIDCardNumber:(NSString *)IDCardNumber;

/**
 校验是否是车牌号码

 @param carID 车牌号码
 @return 是否是车牌号码
 */
+ (BOOL)sl_isValidCarID:(NSString *)carID;

/**
 校验是否是有效数字

 @param num 数字
 @return 是否是有效数字
 */
+(BOOL)sl_isValidNum:(NSString *)num;

/**
 将空格字符和换行字符转换成空字符
 
 @param str 被转换的字符
 @return 转换完成的字符
 */
+ (NSString *)sl_stringByReplacingNullValueWithString:(NSString *)str;

/**
 将时间戳转换yyyy-MM-dd格式时间
 
 @param timeStampStr 时间戳
 @return 转换后的时间
 */
+ (nullable NSString *)sl_getDateWithTimeStamp:(nullable NSString *)timeStampStr;

/**
 将时间戳转换所需要格式时间
 
 @param fmt 格式
 @return 转换后的时间
 */
+ (nullable NSString *)sl_getDateWithDateFormat:(nonnull NSString *)fmt;

/**
 将时间戳转换yyyy-MM-dd HH:mm:ss格式时间
 
 @param timeStampStr 时间戳
 @return 转换后的时间
 */
+ (nullable NSString *)sl_getDetailDateWithTimeStamp:(nonnull NSString *)timeStampStr;

/**
 将时间戳转换指定格式的时间

 @param timeStampStr 时间戳
 @param fmt 指定格式
 @return 转换后的时间字符串
 */
+ (nullable NSString *)sl_getDetailDateWithTimeStamp:(nullable NSString *)timeStampStr dateFormat:(nullable NSString *)fmt;

/**
 获取当前时间字符串
 该时间字符串格式：yyyy-MM-dd HH:mm:ss
 
 @return 当前时间字符串
 */
+ (nullable NSString *)sl_currentDate;

// 获取当前时间
+ (int)sl_currentDateByInt;

/**
 获取当前年份
 */
+ (nullable NSString *)sl_currentYear;

/**
 获取当前月份
 */
+ (nullable NSString *)sl_currentMonth;

/**
 获取当前日
 */
+ (nullable NSString *)sl_currentDay;


/**
 获取现在时间的时间戳（秒）

 @return 时间戳字符串
 */
+ (nonnull NSString *)sl_getNowTimeTimeStamp2Second;

/**
 获取现在时间的时间戳（毫秒）
 
 @return 时间戳字符串
 */
+ (nonnull NSString *)sl_getNowTimeTimeStamp2Millisecond;

/**
 去掉文字内容中首尾的空格

 @return 首尾没有空格的字符串
 */
- (NSString *)sl_removeForeAndAftSpaceString;

/**
 *  ** 在有效日期时间加上 某个时间段(传负数即返回当前时间之前x月x日的时间)
 *
 *  @param year   当前时间若干年后 （传负数为当前时间若干年前）
 *  @param month  当前时间若干月后  （传0即与当前时间一样）
 *  @param day    当前时间若干天后
 *  @param hour   当前时间若干小时后
 *  @param minute 当前时间若干分钟后
 *  @param second 当前时间若干秒后
 *
 *  @return 处理后的时间字符串
 */
- (NSString *)sl_dateStringAfterlocalDateForYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minute:(NSInteger)minute Second:(NSInteger)second;

/**
 截去时间字符串中时区内容
 */
- (NSString *)sl_substringToIndexWithTimeZone;

/**
 计算文本尺寸

 @param font 本文字体
 @param maxW 文本最大宽度
 @return 本文c尺寸
 */
- (CGSize)sl_sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;


/**
 计算本文尺寸

 @param font 文本字体
 @return 文本尺寸
 */
- (CGSize)sl_sizeWithFont:(UIFont *)font;

/**
 由于服务器返回的html源码字符串中有未处理的转义字符，造成加载html文件不能显示图片，需处理替换转义字符
 
 替换html中转义字符串
 */
- (NSString *)sl_replacIgnoreString4HTMLSourceCode;

/** 将 &lt 等类似的字符转化为HTML中的“<”等 */
- (NSString *)sl_htmlEntityDecode;

/** 将HTML字符串转化为NSAttributedString富文本字符串 */
- (NSAttributedString *)sl_attributedStringFromHTMLString;

/** 去掉 HTML 字符串中的标签 */
- (NSString *)sl_filterHTML;


// use demo [htmlString componentsSeparatedFromString:@"<img selector=\"pic\" img-src=\"" toString:@"\" src="];
/**
 截取html需要的字符串
 */
- (NSArray *)sl_componentsSeparatedFromString:(NSString *)fromString toString:(NSString *)toString;

/**
 计算md5值计

 @return md5值
 */
- (NSString *)sl_md5;

/**
 根据参数计算唯一的md5值，使用的撒盐，2次md5处理，得到的是唯一的不重复的md5值
 
 @param aParamas 字典参数
 @param aTime 时间戳
 @param aSalt 撒盐处理
 @return md5值
 */
+ (NSString *)sl_md5ForParamas:(NSDictionary *)aParamas time:(int)aTime salt:(NSString *)aSalt;

/// 截取字符串数组
/// @param begin 开始字符
/// @param end 结束字符
- (NSMutableArray<NSString *> *)sl_substringsWithBegin:(NSString *)begin
                                               withEnd:(NSString *)end;

NS_ASSUME_NONNULL_END

@end
