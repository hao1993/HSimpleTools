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

//    NSString *object = nil;
//    NSMutableArray *array = [NSMutableArray array];
//    [array addObject:@"hi"];
//    [array addObject:object];
//    NSLog(@"%@", array);

//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[@"name"] = @"jack";
//    dict[@"weight"] = object;
//    NSLog(@"%@", dict);
    

    
    // NSMutableArray 数组越界
    NSMutableArray *mutableArray = [NSMutableArray array];
    [mutableArray addObject:@"1"];
    [mutableArray addObject:@"2"];
    [mutableArray addObject:@"3"];
    NSString *mutableArrayString = mutableArray[4];
    NSLog(@"mutableArray:%@  string:%@", mutableArray, mutableArrayString);
    
    // NSArray 数组越界
    NSArray *array = @[@"1", @"2", @"3"];
    NSString *arrayString = array[4];
    NSLog(@"array:%@  string:%@", array, arrayString);

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
