//
//  NSObject+Property.m
//  Runtime Add Property
//
//  Created by Edward on 16/11/28.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>


@implementation NSObject (Property)



- (void)setPlace:(NSString *)place {
    
    // 将某个值跟某个对象关联起来，将某个值存储到某个对象中
    
    //第一个参数 Object：给哪个对象设置属性
    //第二个参数 key：一个属性对应一个Key，将来可以通过key取出这个存储的值，key 可以是任何类型：double、int 等，建议用char 可以节省字节
    //第三个参数 value：给属性设置的值
    // 第四个参数 policy: 关联的策略(这个策略其实就是用@Property时候的策略)
    objc_setAssociatedObject(self, @"place", place, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)place {
    
//    利用参数key 将对象object中存储的对应值取出来
    // 根据关联的key，获取关联的值。
    return objc_getAssociatedObject(self, @"place");
}


@end
