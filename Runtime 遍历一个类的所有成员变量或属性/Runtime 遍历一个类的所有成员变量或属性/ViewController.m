//
//  ViewController.m
//  Runtime 遍历一个类的所有成员变量或属性
//
//  Created by Edward on 16/11/26.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"

#define PLJLog(A)  NSLog(@"%@",A)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 获取一个类的所有成员变量
    [self getAllIvars];
    
    // 获取一个类的所有的属性
    [self getAllProperties];
}

- (void)getAllIvars {
    
    unsigned int count = 0;
    
    // 获取指向这个类的成员变量数组的指针
    Ivar *ivars = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];//获取单个成员变量
        const char *name = ivar_getName(ivar);// 获取单个成员变量的名称 C语言字符串
        NSString *ivarName = [NSString stringWithUTF8String:name];
        PLJLog(ivarName);
    }
}

- (void)getAllProperties {
    
    unsigned int count = 0;
    
    // 获取指向一个类的属性数组的指针
    objc_property_t *properties = class_copyPropertyList([Person class], &count);
    for (int i = 0; i < count ; i++) {
        objc_property_t property = properties[i];// 获取单个属性
        const char *name = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:name];
        PLJLog(propertyName);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
