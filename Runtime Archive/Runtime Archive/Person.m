//
//  Person.m
//  Runtime Archive
//
// 归档存储自定义对象
//  Created by Edward on 16/11/26.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    unsigned int count = 0;
    
    // 获取指向该类所有的属性的指针
    objc_property_t *properties = class_copyPropertyList([Person class], &count);
    
    for (int i = 0; i < count; i++) {
        
        // 获取每个属性的名字
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *key = [NSString stringWithUTF8String:name];// 转成OC的字符串
        // 利用KVC取出每个属性对应的数值
        [aCoder encodeObject:[self valueForKeyPath:key] forKey:key];
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    unsigned int count = 0;
    
    // 获取指向该类的所有属性的指针
    objc_property_t *properties = class_copyPropertyList([Person class], &count);
    
    for (int i = 0; i < count; i++) {
        
        objc_property_t property = properties[i];// 获取到每个属性
        const char *name = property_getName(property);// 获取每个属性的名字
        NSString *key = [NSString stringWithUTF8String:name];// 转成OC字符串
        
        //解码每个属性,利用kVC取出每个属性对应的数值
        [self setValue:[aDecoder decodeObjectForKey:key] forKeyPath:key];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@\nage: %lu\ngender: %u",self.name,(unsigned long)self.age,self.gender];
}

@end
