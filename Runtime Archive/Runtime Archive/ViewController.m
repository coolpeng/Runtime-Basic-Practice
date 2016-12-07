//
//  ViewController.m
//  Runtime Archive
//
//  Created by Edward on 16/11/26.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [[Person alloc] init];
    person.name = @"xiaowang";
    person.age = 10;
    person.gender = female;
    
#if 0  // 归档
    NSString *string = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    NSString *path = [string stringByAppendingString:@"/Person.text"];
    [NSKeyedArchiver archiveRootObject:person toFile:path];
    NSLog(@"归档成功");
    
#else
    // 解档
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"/Person.text"];
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"解档成功：%@",p);

#endif
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
