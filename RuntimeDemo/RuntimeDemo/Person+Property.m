//
//  Person+Property.m
//  RuntimeDemo
//
//  Created by MaBiao on 2018/3/18.
//  Copyright © 2018年 BiaoMa. All rights reserved.
//

#import "Person+Property.h"
#import <objc/message.h>


@implementation Person (Property)

- (void)setName:(NSString *)name
{
//    _name = name;
    //object:给那个对象添加属性
    //key： 属性名称
    //value: 属性值
    //policy: 保存策略
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSLog(@"添加动态属性name的set = %@",name);
}

- (NSString *)name
{
    return objc_getAssociatedObject(self, @"name");
}
@end
