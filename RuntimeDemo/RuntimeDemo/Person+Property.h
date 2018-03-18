//
//  Person+Property.h
//  RuntimeDemo
//
//  Created by MaBiao on 2018/3/18.
//  Copyright © 2018年 BiaoMa. All rights reserved.
//  动态添加属性

#import "Person.h"

@interface Person (Property)

//@property在分类中：只会生成get,set方法声明，不会生成实现，也不会生成下划线成员属性
@property NSString *name;

@end
