//
//  ViewController.m
//  Runtime Exchange Method
//
//  Created by Edward on 16/12/5.
//  Copyright © 2016年 coolpeng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "UIImage+NSLog.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    // 实现自定义类中 方法的交换
    [Person run];
    [Person eat];
    
    //下面通过runtime 实现方法交换，类方法用class_getClassMethod ，对象方法用class_getInstanceMethod
    // 获取两个类的类方法
    Method m1 = class_getClassMethod([Person class], @selector(run));
    Method m2 = class_getClassMethod([Person class], @selector(eat));
    
    // 开始交换方法实现
    method_exchangeImplementations(m1, m2);
    
    [Person run];
    [Person eat];
    
    // 拦截系统方法 实现方法交换
    UIImage *image =[UIImage imageNamed:@"hahahaha"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
