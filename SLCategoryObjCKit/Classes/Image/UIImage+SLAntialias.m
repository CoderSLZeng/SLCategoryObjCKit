//
//  UIImage+SLAntialias.h
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/22.
//

#import "UIImage+SLAntialias.h"

@implementation UIImage (SLAntialias)
// 在周边加一个边框为1的透明像素
- (UIImage *)sl_imageAntialias
{
    CGFloat border = 1.0f;
    CGRect rect = CGRectMake(border, border, self.size.width-2*border, self.size.height-2*border);
    
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width,rect.size.height));
    [self drawInRect:CGRectMake(-1, -1, self.size.width, self.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:rect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}

@end
