//
//  UIButton+MultiClick.h
//  RuntimeDemo
//
//  Created by MaBiao on 2018/3/19.
//  Copyright © 2018年 BiaoMa. All rights reserved.
//  UIButton 重复点击问题

#import <UIKit/UIKit.h>

@interface UIButton (MultiClick)

@property (nonatomic, assign) NSTimeInterval acceptEventInterval; // 重复点击的间隔

@property (nonatomic, assign) NSTimeInterval acceptEventTime;

@end
