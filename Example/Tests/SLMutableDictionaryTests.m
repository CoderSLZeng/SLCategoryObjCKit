//
//  SLMutableDictionaryTests.m
//  SLCategoryObjCKit_Tests
//
//  Created by CoderSLZeng on 2019/3/7.
//  Copyright © 2019 CoderSLZeng. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface SLMutableDictionaryTests : XCTestCase

@end

@implementation SLMutableDictionaryTests

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
    NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
    mDict[@"name"] = @"Jerry";
    mDict[obj] = @"18";
    mDict[@"age"] = obj;
    mDict[@"height"] = @176;
    
    NSLog(@"%@", mDict);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
