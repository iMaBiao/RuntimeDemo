//
//  NSObject+KeyValues.h
//  RuntimeDemo
//
//  Created by MaBiao on 2018/3/16.
//  Copyright © 2018年 BiaoMa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KeyValues)

+ (id)objectWithKeyValues:(NSDictionary *)aDictionary;

- (NSDictionary *)keyValuesWithObject;

@end
