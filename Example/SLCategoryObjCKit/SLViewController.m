//
//  SLViewController.m
//  SLCategoryObjCKit
//
//  Created by CoderSLZeng on 02/19/2019.
//  Copyright (c) 2019 CoderSLZeng. All rights reserved.
//

#import "SLViewController.h"
#import <SLCategoryObjCKit/NSString+SLExtension.h>

@interface SLViewController ()

@end

@implementation SLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSURL *url = [NSURL URLWithString:@"http://free2.macx.cn:8281/tools/photo/SnapNDragPro418.dmg"];
    NSString *str = url.absoluteString;
    NSLog(@"%@", str.sl_md5);
}

@end
