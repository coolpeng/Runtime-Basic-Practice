//
//  UIImage+NSLog.m
//  Runtime Exchange Method
//
//  Created by Edward on 16/12/5.
//  Copyright © 2016年 coolpeng. All rights reserved.
//

#import "UIImage+NSLog.h"
#import <objc/runtime.h>

@implementation UIImage (NSLog)

+ (void)load {
    
    // 获取方法地址
    Method m1 = class_getClassMethod([self class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([self class], @selector(imageWithName:));
    
    // 交换方法的实现
    method_exchangeImplementations(m1, m2);
}

// 实现加载图片并打印图片的名称
+ (instancetype)imageWithName:(NSString *)name {
    
    UIImage *image = [self imageWithName:name];
    
    NSLog(@"%@",name);
    
    return image;
}

@end
