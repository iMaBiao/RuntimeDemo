//
//  Test.m
//  RuntimeDemo
//
//  Created by MaBiao on 2018/3/15.
//  Copyright © 2018年 BiaoMa. All rights reserved.
//

#import "Test.h"
#import <objc/objc.h>
@implementation Test
- (instancetype)init
{
    if (self = [super init]) {
        [self show];
    }
    return self;
}
/**  clang -rewrite-objc Test.m
 static instancetype _I_Test_init(Test * self, SEL _cmd) {
 if (self = ((Test *(*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("Test"))}, sel_registerName("init"))) {
 ((void (*)(id, SEL))(void *)objc_msgSend)((id)self, sel_registerName("show"));
 }
 return self;
 }
 */

- (void)show{
    NSLog(@"%s ",__FUNCTION__);
}
-(void)showAge{
    NSLog(@"24");
}
-(void)showName:(NSString *)aName{
    NSLog(@"name is %@",aName);
}
-(void)showSizeWithWidth:(float)aWidth andHeight:(float)aHeight{
    NSLog(@"size is %.2f * %.2f",aWidth, aHeight);
}
-(float)getHeight{
    return 187.5f;
}
-(NSString *)getInfo{
    return @"Hi, my name is Dave Ping, I'm twenty-four years old in the year, I like apple, nice to meet you.";
}
@end
