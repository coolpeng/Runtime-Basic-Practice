//
//  Person.h
//  Runtime 遍历一个类的所有成员变量或属性
//
//  Created by Edward on 16/11/26.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum Gender {
    male,
    female
}Gender;

@interface Person : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSUInteger age;
@property (nonatomic,assign) Gender gender;

@end
