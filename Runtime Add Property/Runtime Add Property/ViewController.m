//
//  ViewController.m
//  Runtime Add Property
//
//  Created by Edward on 16/11/28.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Property.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSObject *objc = [[NSObject alloc] init];
    objc.place = @"Beijing";
    
    NSLog(@"%@",objc.place);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
