//
//  UITextField+SLFastCreateSearchBar.m
//  SLCategoryKit
//
//  Created by CoderSLZeng on 2017/11/22.
//

#import "UITextField+SLFastCreateSearchBar.h"

static NSString * const SLPlaceholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (SLFastCreateSearchBar)

- (void)setSl_placeholderColor:(UIColor *)sl_placeholderColor
{
    NSString *oldPlacehoder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlacehoder;
    
    if (sl_placeholderColor == nil) {
        sl_placeholderColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0.0980392/255.0 alpha:0.22/255.0];
    }
    
    [self setValue:sl_placeholderColor forKeyPath:SLPlaceholderColorKey];
}

- (UIColor *)sl_placeholderColor
{
    return [self valueForKeyPath:SLPlaceholderColorKey];
}


/**
 *  添加一个搜索框
 *
 *  @return 搜索框
 */
+ (instancetype) sl_searchBarWithFrame:(CGRect)frame
                   backgroundImageName:(nonnull NSString *)backgroundImageName
                   searchIconImageName:(nonnull NSString *)searchIconImageName
{
    UITextField *searchBar = [[UITextField alloc] init];
    searchBar.frame        = frame;
    searchBar.placeholder  = @"请输入搜索内容条件";
    
    NSString *searchBarImageFile = [[NSBundle mainBundle] pathForResource:backgroundImageName ofType:@".png"];
    
    if (searchBarImageFile == nil) {
        NSException *excp = [NSException exceptionWithName:@"pathError"
                                                    reason:@"调用此方法必须提供一个有效的【背景图标名】参数, 请确认是否添加图片资源"
                                                  userInfo:nil];
        [excp raise];
        return nil;
    }
    
    UIImage *searchBarImage = [UIImage imageWithContentsOfFile:searchBarImageFile];
    
    CGFloat searchBarW = searchBarImage.size.width * 0.5;
    CGFloat searchBarH = searchBarImage.size.height * 0.5;
    
    // 设置背景图片为可拉伸模式的
    searchBar.background = [searchBarImage resizableImageWithCapInsets:UIEdgeInsetsMake(searchBarH, searchBarW, searchBarH, searchBarW)
                                                          resizingMode:UIImageResizingModeStretch];
    
    UIImageView *searchIcon = [[UIImageView alloc] init];
    searchIcon.bounds = CGRectMake(0, 0, 30, 30);
    NSString *iconImageFile = [[NSBundle mainBundle] pathForResource:searchIconImageName ofType:@".png"];
    if (searchBarImageFile == nil) {
        NSException *excp = [NSException exceptionWithName:@"pathError"
                                                    reason:@"调用此方法必须提供一个有效的【搜索图标名】参数, 请确认是否添加图片资源"
                                                  userInfo:nil];
        [excp raise];
        return nil;
    }
    UIImage *iconImage = [UIImage imageWithContentsOfFile:iconImageFile];
    searchIcon.image = iconImage;

    // 内容模式居中
    searchIcon.contentMode = UIViewContentModeCenter;
    
    // 左边的视图
    searchBar.leftView = searchIcon;
    // 显示模式
    searchBar.leftViewMode = UITextFieldViewModeAlways;
    
    return searchBar;
}

@end
