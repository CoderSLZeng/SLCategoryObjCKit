//
//  SLViewController.m
//  SLCategoryObjCKit
//
//  Created by CoderSLZeng on 02/19/2019.
//  Copyright (c) 2019 CoderSLZeng. All rights reserved.
//

#import "SLViewController.h"

#import "UITextField+SLFastCreateSearchBar.h"

@interface SLViewController ()

@end

@implementation SLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self testTextField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testTextField {
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 40;
    UIFont *font = [UIFont systemFontOfSize:13.0f];
    UITextField *customTF = [UITextField sl_searchBarWithFrame:CGRectMake(20, 50, width, 30)
                                                          font:font
                                           backgroundImageName:@"searchbar_textfield_background@2x"
                                           searchIconImageName:@"searchbar_textfield_search_icon@2x"];
    [self.view addSubview:customTF];
}

@end
