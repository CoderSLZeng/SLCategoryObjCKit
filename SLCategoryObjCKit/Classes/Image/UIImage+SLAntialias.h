//
//  UIImage+SLAntialias.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/22.
//  创建抗锯齿图片
//

#import <UIKit/UIKit.h>

@interface UIImage (SLAntialias)

// 返回一张抗锯齿图片
// 本质：在图片生成一个透明为1的像素边框
- (UIImage *)sl_imageAntialias;

@end
