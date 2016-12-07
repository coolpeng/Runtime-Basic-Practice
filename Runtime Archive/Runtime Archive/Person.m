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

// 设置不需要归解档的属性
- (NSArray *)ignoredNames {
    return @[@"name"];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    unsigned int count = 0;
    
    // 获取指向该类所有的属性的指针
    objc_property_t *properties = class_copyPropertyList([Person class], &count);
    
    for (int i = 0; i < count; i++) {
        
        // 获取每个属性的名字
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *key = [NSString stringWithUTF8String:name];// 将每个属性名转换为NSString对象类型
        
        // 忽略不需要归档的属性
        if ([[self ignoredNames] containsObject:key]) {
            continue;
        }
        
        // 通过属性名，取出对应的值
        id value = [self valueForKeyPath:key];
        
        // 再将值归档
        [aCoder encodeObject:value forKey:key];
    }
    
    // 注意释放内存！
    free(properties);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    unsigned int count = 0;
    
    // 获取指向该类的所有属性的指针
    objc_property_t *properties = class_copyPropertyList([Person class], &count);
    
    for (int i = 0; i < count; i++) {
        
        objc_property_t property = properties[i];// 获取到每个属性
        const char *name = property_getName(property);// 获取每个属性的名字
        NSString *key = [NSString stringWithUTF8String:name];// 将每个属性名转换为NSString对象类型
        
        // 忽略不需要解档的属性
        if ([[self ignoredNames] containsObject:key]) {
            continue;
        }

        // 根据属性名解档取值，无论是什么类型
        id value = [aDecoder decodeObjectForKey:key];
        
        // 取出的值再设置给属性
        [self setValue:value forKeyPath:key];
    }
    
    // 注意释放内存！
    free(properties);
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@\nage: %lu\ngender: %u",self.name,(unsigned long)self.age,self.gender];
}

@end
