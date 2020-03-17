//
//  UILabel+SLTextAlign.m
//  SLCategoryObjCKit
//
//  Created by CoderSLZeng on 2018/10/9.
//  Copyright © 2018年 CoderSLZeng. All rights reserved.
//

#import "UILabel+SLTextAlign.h"

@implementation UILabel (SLTextAlign)

- (void)setIsTop:(BOOL)isTop {
    
    if (isTop) {
        CGSize fontSize = [self.text sizeWithFont:self.font];
        // 控件的高度除以一行文字的高度
        int num = self.frame.size.height / fontSize.height;
        // 计算需要添加换行符个数
        int newLinesToPad = num  - self.numberOfLines;
        self.numberOfLines = 0;
        for(int i=0; i<newLinesToPad; i++)
            // 在文字后面添加换行符"/n"
            self.text = [self.text stringByAppendingString:@"\n"];
    }
}

- (void)setIsBottom:(BOOL)isBottom {
    
    if (isBottom) {
        CGSize fontSize = [self.text sizeWithFont:self.font];
        // 控件的高度除以一行文字的高度
        int num = self.frame.size.height/fontSize.height;
        // 计算需要添加换行符个数
        int newLinesToPad = num  - self.numberOfLines;
        self.numberOfLines = 0;
        for(int i=0; i<newLinesToPad; i++)
            // 在文字前面添加换行符"/n"
            self.text = [NSString stringWithFormat:@" \n%@", self.text];
    }
}
@end
