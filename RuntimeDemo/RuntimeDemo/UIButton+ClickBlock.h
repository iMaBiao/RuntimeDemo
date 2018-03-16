//
//  UIButton+ClickBlock.h
//  RuntimeDemo
//
//  Created by MaBiao on 2018/3/16.
//  Copyright © 2018年 BiaoMa. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickBlock)(void);

@interface UIButton (ClickBlock)

@property (nonatomic,copy) clickBlock click;

@end
