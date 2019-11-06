//
//  NSArray+SLExtension.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2019/10/30.
//  终端打印显示中文
//

#import "NSArray+SLExtension.h"

@implementation NSArray (SLExtension)

/**
 *  使用NSLog方法，让终端能显示中文
 *  NSLog(@"%@", array);
 *  
 *  @param locale 本地的数据
 *
 *  @return 重写字符串格式
 */
- (NSString *)descriptionWithLocale:(id)locale {
    // 创建一个可变的字符串
    NSMutableString *strM = [NSMutableString stringWithString:@"\n"];
    
    for (id obj in self) {
        [strM appendFormat:@"\t%@,\n", obj];
    }
    [strM appendString:@")\n"];
    
    return strM;
}

@end
