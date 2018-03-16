//
//  TestModel.h
//  RuntimeDemo
//
//  Created by MaBiao on 2018/3/16.
//  Copyright © 2018年 BiaoMa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, copy) NSNumber *phoneNumber;
@property (nonatomic, copy) NSNumber *height;

@property (nonatomic, strong) NSDictionary *info;

@property (nonatomic, strong) TestModel *son;



@end
