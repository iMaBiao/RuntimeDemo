//
//  TestSon.m
//  RuntimeDemo
//
//  Created by MaBiao on 2018/3/16.
//  Copyright © 2018年 BiaoMa. All rights reserved.
//

#import "TestSon.h"

@implementation TestSon
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@", NSStringFromClass([self class]));  //TestSon
        NSLog(@"%@", NSStringFromClass([super class])); //TestSon
    }
    return self;
}
@end
