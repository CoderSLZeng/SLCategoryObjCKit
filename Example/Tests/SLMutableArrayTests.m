//
//  SLMutableArrayTests.m
//  SLCategoryObjCKit_Tests
//
//  Created by CoderSLZeng on 2019/3/7.
//  Copyright © 2019 CoderSLZeng. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface SLMutableArrayTests : XCTestCase

@end

@implementation SLMutableArrayTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSString *obj = nil;
    
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    
    // 获取 mArray 实际类型
//    NSLog(@"%@", [mArray class]);
    
    [mArray addObject:@"Tom"];
    [mArray addObject:obj];
    [mArray addObject:@10];
    
    NSLog(@"%@", mArray);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
