//
//  ViewController.m
//  HSimpleTools
//
//  Created by 杨世浩 on 2019/1/19.
//  Copyright © 2019 hao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *object = nil;
//    NSMutableArray *array = [NSMutableArray array];
//    [array addObject:@"hi"];
//    [array addObject:object];
//    NSLog(@"%@", array);

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"name"] = @"jack";
    dict[@"weight"] = object;
    NSLog(@"%@", dict); 
}

- (IBAction)click1 {
    NSLog(@"%s", __func__);
}

- (IBAction)click2 {
    NSLog(@"%s", __func__);
}

- (IBAction)click3 {
    NSLog(@"%s", __func__);
}


@end
