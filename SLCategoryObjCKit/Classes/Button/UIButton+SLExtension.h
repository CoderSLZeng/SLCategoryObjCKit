//
//  UIButton+SLExtension.h
//  PartyConstruction
//
//  Created by CoderSLZeng on 2018/9/26.
//  创建按钮
//

#import <UIKit/UIKit.h>

@interface UIButton (SLExtension)

/**
 自定义按钮边框

 @param color 边框颜色
 @param width 边框宽度
 @param radius 圆角值
 */
- (void)sl_customLayerWithBorderColor:(UIColor *)color borderWidth:(CGFloat)width cornerRadius:(CGFloat)radius;
@end
