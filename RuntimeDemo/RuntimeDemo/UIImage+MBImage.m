//
//  UIImage+MBImage.m
//  RuntimeDemo
//
//  Created by MaBiao on 2018/3/18.
//  Copyright © 2018年 BiaoMa. All rights reserved.
//

#import "UIImage+MBImage.h"
#import <objc/message.h>
@implementation UIImage (MBImage)


+ (void)load
{
    //获取方法名
    Method imageNamed =  class_getClassMethod(self, @selector(imageNamed:));
    
    Method mb_imageNamed =  class_getClassMethod(self, @selector(mb_imageNamed:));
    
    //调用时，两个方法交换
    method_exchangeImplementations(imageNamed, mb_imageNamed);
}

+ (UIImage *)mb_imageNamed:(NSString *)name
{
    UIImage *image = [UIImage mb_imageNamed:name];//此时方法交换，会调用imageNamed:
    if (image == nil) {
        NSLog(@"图片加载失败");
    }else{
        NSLog(@"图片加载成功");
    }
    return image;
}

@end
