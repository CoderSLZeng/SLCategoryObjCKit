//
//  SLNSStringTests.m
//  SLCategoryObjCKit_Tests
//
//  Created by CoderSLZeng on 2019/6/26.
//  Copyright © 2019 CoderSLZeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SLCategoryObjCKit/NSString+SLExtension.h>

@interface SLNSStringTests : XCTestCase

@end

@implementation SLNSStringTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testMD5 {
    NSURL *url = [NSURL URLWithString:@"http://free2.macx.cn:8281/tools/photo/SnapNDragPro418.dmg"];
    NSString *str = url.absoluteString;
    NSLog(@"%@", str.sl_md5); // e198786fc9600dcf2fdec82b7ad9ac6c
}

- (void)testMD5_2 {
    NSDictionary *paramas = @{@"name" : @"jack",
                              @"age"     : @18,
                              @"height"  : @176
                              };
    int aTime = [NSString sl_currentDateByInt];
    NSString *md5 = [NSString sl_md5ForParamas:paramas time:aTime salt:@"ziiiro"];
    NSLog(@"%@", md5);
}

- (void)testCuttrenDate {
    NSString *dateStr = [NSString sl_currentDate]; // 2019-06-27 10:20:03
    NSLog(@"%@", dateStr);
}

- (void)testCurrentDateByInt {
    int time = [NSString sl_currentDateByInt];
    NSLog(@"time = %d", time); // 1561601946
    NSString *dateStr = [NSString sl_getNowTimeTimeStamp2Second];
    NSLog(@"%@", dateStr); // @"1561601946"
}

- (void)testSubstringsOfString {
    NSString *str = @"abobmsijdojsadasdccxsab";
    NSArray *results = [str sl_substringsWithBegin:@"a" withEnd:@"b"];
    for (NSString *result in results) {
        NSLog(@"%@", result);
    }
}









@end
