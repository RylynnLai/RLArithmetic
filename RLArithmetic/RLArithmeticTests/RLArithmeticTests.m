//
//  RLArithmeticTests.m
//  RLArithmeticTests
//
//  Created by LLZ on 2018/1/5.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+UCSDecimalNumber.h"
#import "NSNumber+UCSDecimalNumber.h"

@interface RLArithmeticTests : XCTestCase

@end

@implementation RLArithmeticTests
static NSString *nilStr = nil;
static NSString *emptyStr = @"";
static NSString *otherStr = @"abc";

static NSString *a = @"0.01";
static NSString *b = @"99999999";
static NSString *c = @"0.000000001";
static NSString *d = @"0.11111111";
static NSString *e = @"10000000";
static NSString *f = @"0.1111111155";
static NSString *g = @"0.1111111154";
static NSString *h = @"0.11111110";

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    UIView *otherObj = [UIView new];
    //第一个操作数用例
    XCTAssertTrue([@"".add(@"2") isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([@"".sub(@"2") isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([@"".mul(@"2") isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([@"".div(@"2") isEqualToString:@""], @"空字符串运算错误");
    
    XCTAssertTrue([@"abc".add(@"2") isEqualToString:@""], @"其他字符串运算错误");
    XCTAssertTrue([@"abc".sub(@"2") isEqualToString:@""], @"其他字符串运算错误");
    XCTAssertTrue([@"abc".mul(@"2") isEqualToString:@""], @"其他字符串运算错误");
    XCTAssertTrue([@"abc".div(@"2") isEqualToString:@""], @"其他字符串运算错误");
    
    XCTAssertTrue([COU(nilStr).add(@"2") isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([COU(nilStr).sub(@"2") isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([COU(nilStr).mul(@"2") isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([COU(nilStr).div(@"2") isEqualToString:@""], @"空字符串运算错误");
    
    XCTAssertTrue([COU(emptyStr).add(@"2") isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([COU(emptyStr).sub(@"2") isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([COU(emptyStr).mul(@"2") isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([COU(emptyStr).div(@"2") isEqualToString:@""], @"空字符串运算错误");
    
    XCTAssertTrue([COU(otherStr).add(@"2") isEqualToString:@""], @"其他字符串运算错误");
    XCTAssertTrue([COU(otherStr).sub(@"2") isEqualToString:@""], @"其他字符串运算错误");
    XCTAssertTrue([COU(otherStr).mul(@"2") isEqualToString:@""], @"其他字符串运算错误");
    XCTAssertTrue([COU(otherStr).div(@"2") isEqualToString:@""], @"其他字符串运算错误");
    
    XCTAssertTrue([COU(otherObj).add(@"2") isEqualToString:@""], @"非数字运算错误");
    XCTAssertTrue([COU(otherObj).sub(@"2") isEqualToString:@""], @"非数字运算错误");
    XCTAssertTrue([COU(otherObj).mul(@"2") isEqualToString:@""], @"非数字运算错误");
    XCTAssertTrue([COU(otherObj).div(@"2") isEqualToString:@""], @"非数字运算错误");
    //第二个操作数测试用例
    XCTAssertTrue([@"2".add(nil) isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([@"2".add(@"") isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([@"2".add(emptyStr) isEqualToString:@""], @"空字符串运算错误");
    XCTAssertTrue([@"2".add(otherStr) isEqualToString:@""], @"其他字符串运算错误");
    XCTAssertTrue([@"2".add(otherObj) isEqualToString:@""], @"非数字运算错误");
    
    XCTAssertTrue([@"2".div(@0) isEqualToString:@""], @"除法运算错误");
    XCTAssertTrue([@"2".div(@"0") isEqualToString:@""], @"除法运算错误");
    
    //四则运算
    XCTAssertTrue([@"2".add(@"2").sub(@"2").mul(@"2").div(@2) isEqualToString:@"2"], @"四则运算错误");
    XCTAssertTrue([COU(a).mul(b) isEqualToString:@"999999.99"], @"四则运算错误");
    XCTAssertTrue([COU(b).mul(c) isEqualToString:@"0.099999999"], @"四则运算错误");
    XCTAssertTrue([COU(d).mul(e) isEqualToString:@"1111111.1"], @"四则运算错误");
    
    //格式化输出
    XCTAssertTrue([COU(d).mul(e).roundPlain(2) isEqualToString:@"1111111.1"], @"格式化输出错误");
    XCTAssertTrue([COU(f).mul(e).roundPlain(2) isEqualToString:@"1111111.16"], @"格式化输出错误");
    XCTAssertTrue([COU(d).mul(e).roundPlainWithZeroFill(2) isEqualToString:@"1111111.10"], @"格式化输出错误");
    XCTAssertTrue([COU(d).mul(e).formatToThousandsWithRoundPlain(2) isEqualToString:@"1,111,111.10"], @"格式化输出错误");
    XCTAssertTrue([COU(f).mul(e).formatToThousandsWithRoundPlain(2) isEqualToString:@"1,111,111.16"], @"格式化输出错误");
    XCTAssertTrue([COU(f).mul(e).formatToThousandsWithRoundPlain(2) isEqualToString:@"1,111,111.16"], @"格式化输出错误");
    XCTAssertTrue([COU(g).mul(e).formatToThousandsWithRoundUp(2) isEqualToString:@"1,111,111.16"], @"格式化输出错误");
    XCTAssertTrue([COU(g).mul(e).formatToThousandsWithRoundDown(2) isEqualToString:@"1,111,111.15"], @"格式化输出错误");
    
    //大小比较
    XCTAssertEqual(COU(f).compare(g), RLOrderedDescending, @"大小比较错误");
    XCTAssertEqual(COU(h).compare(d), RLOrderedAscending, @"大小比较错误");
    XCTAssertEqual(COU(f).compare(f), RLOrderedSame, @"大小比较错误");
    XCTAssertEqual(COU(f).compare(@"dsf"), RLNaNError, @"大小比较错误");
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
