//
//  ViewController.m
//  RuntimeDemo
//
//  Created by MaBiao on 2018/3/15.
//  Copyright © 2018年 BiaoMa. All rights reserved.
//
/**
 http://www.cocoachina.com/ios/20160523/16386.html
 http://yulingtianxia.com/blog/2014/11/05/objective-c-runtime/
 */
#import "ViewController.h"
#import <objc/message.h>
#import "UIButton+ClickBlock.h"
#import "Test.h"
#import "TestSon.h"
#import "TestModel.h"
#import "NSObject+KeyValues.h"
#import "Monkey.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSDictionary *dictionary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    dictionary = @{
                   @"name":@"Dave Ping",
                   @"age":@24,
                   @"phoneNumber":@18718871111,
                   @"height":@180.5,
                   @"info":@{
                           @"address":@"Guangzhou",
                           },
                   @"son":@{
                           @"name":@"Jack",
                           @"info":@{
                                   @"address":@"London",
                                   },
                           }
                   };


//    [self msgSendTest];

//    TestSon *son = [[TestSon alloc]init];

//    [self buttonTest];

//    [self keyValueTest];

//    [self keyedArchiverTest];

    [self forwardingTest];

}

//动态方法解析
- (void)forwardingTest
{
    Monkey *monkey = [[Monkey alloc]init];
    ((void(*)(id,SEL)) objc_msgSend)(monkey,sel_registerName("fly"));
}
//自动归档
- (void)keyedArchiverTest{

    TestModel *model = [TestModel objectWithKeyValues:dictionary];

    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    path = [path stringByAppendingPathComponent:@"test.txt"];
    [NSKeyedArchiver archiveRootObject:model toFile:path];

    TestModel *m = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"m.name is %@",m.name);
    NSLog(@"m.son name is %@",m.son.name);
}
//字典与模型互转
- (void)keyValueTest{

    TestModel *model = [TestModel objectWithKeyValues:dictionary];
    NSLog(@"name is %@",model.name);
    NSLog(@"son name is %@",model.son.name);

    NSDictionary *dict = [model keyValuesWithObject];
    NSLog(@"dict is %@",dict);
}
//对象关联 给Category添加属性
- (void)buttonTest
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = self.view.bounds;
    [self.view addSubview:btn];

    btn.click = ^{
        NSLog(@"%s btn-clickBlock",__FUNCTION__);
    };
}

//使用objc_msgSend调用方法
- (void)msgSendTest{
    Test *objct = [[Test alloc] init];

    ((void (*) (id, SEL)) objc_msgSend) (objct, sel_registerName("showAge"));

    ((void (*) (id, SEL, NSString *)) objc_msgSend) (objct, sel_registerName("showName:"), @"Dave Ping");

    ((void (*) (id, SEL, float, float)) objc_msgSend) (objct, sel_registerName("showSizeWithWidth:andHeight:"), 110.5f, 200.0f);

    float f = ((float (*) (id, SEL)) objc_msgSend_fpret) (objct, sel_registerName("getHeight"));
    NSLog(@"height is %.2f",f);

    NSString *info = ((NSString* (*) (id, SEL)) objc_msgSend) (objct, sel_registerName("getInfo"));
    NSLog(@"%@",info);
}


@end
