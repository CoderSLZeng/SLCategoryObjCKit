//
//  SLViewController.m
//  SLCategoryObjCKit
//
//  Created by CoderSLZeng on 02/19/2019.
//  Copyright (c) 2019 CoderSLZeng. All rights reserved.
//

#import "SLViewController.h"

#import <UITextField+SLFastCreateSearchBar.h>
#import <UIColor+SLExtension.h>

@interface SLViewController ()

@end

@implementation SLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testTextField {
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 40;
    CGRect frame = CGRectMake(20, 50, width, 30);
    UIFont *font = [UIFont systemFontOfSize:9.0f];
    UITextField *customTF = [UITextField sl_searchBarWithFrame:frame
                                           backgroundImageName:@"searchbar_textfield_background@2x"
                                           searchIconImageName:@"searchbar_textfield_search_icon@2x"
                                                   ofImageType:@"png"];

    customTF.font = font;
    [self.view addSubview:customTF];
}

@end
