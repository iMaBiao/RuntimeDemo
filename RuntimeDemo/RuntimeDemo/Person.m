//
//  Person.m
//  RuntimeDemo
//
//  Created by MaBiao on 2018/3/18.
//  Copyright © 2018年 BiaoMa. All rights reserved.
//

/**
 任何方法默认都要两个隐士参数：self ,_cmd(当前方法的编号)
 */

#import "Person.h"
#import <objc/message.h>

@implementation Person

//没有返回值，没有参数
void add_eat(id self ,SEL _cmd ){
    NSLog(@"成功添加动态方法 - eat");
}
void add_run(id self ,SEL _cmd ,NSNumber *meter){
    NSLog(@"成功添加动态方法 - run - %@",meter);
}

//什么时候调用：只要一个对象调用了一个未实现线的方法就会调用这个方法进行处理
//作用：动态添加方法，处理未实现的方法

//处理类没有实现的方法
+ (BOOL)resolveClassMethod:(SEL)sel
{
    return [super resolveClassMethod:sel];
}

//处理实例对象没有实现的方法
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == NSSelectorFromString(@"eat")) {
        //参数
        //给哪个类添加方法
        //SEL添加哪个方法
        //IMP 方法实现 =》函数 =》函数入口 =》 函数名
        //type 方法类型
        class_addMethod(self, sel, (IMP)add_eat, "v@:");
        
        return YES;
    }
    
    if (sel == NSSelectorFromString(@"run:")) {

        class_addMethod(self, sel, (IMP)add_run, "v@:@");
        
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
@end
