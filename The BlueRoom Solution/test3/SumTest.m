//
//  SumTest.m
//  test3
//
//  Created by Stephanie Wang on 2/5/17.
//  Copyright © 2017 hack@brown. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Fun.h"

@interface SumTest : XCTestCase

@end

@implementation SumTest

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
    
    NSArray* combos = sumAlgorithm(@[
                   @[@"1", @"Yorgo Salad", @"4.0"],
                   @[@"2", @"Sushi", @"6.0"]
                   ], 12.0);
    NSLog(@"Results: %@", combos);
    NSArray* expected = @[@[@"Yorgo Salad", @"Yorgo Salad", @"Yorgo Salad"], @[@"Sushi", @"Sushi"]];
    XCTAssertEqualObjects(combos, expected);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
