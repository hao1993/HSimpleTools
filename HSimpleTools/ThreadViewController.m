//
//  ThreadViewController.m
//  HSimpleTools
//
//  Created by 杨世浩 on 2019/1/20.
//  Copyright © 2019 hao. All rights reserved.
//

#import "ThreadViewController.h"
#import "HPermenantThread.h"

@interface ThreadViewController ()
@property (nonatomic, strong) HPermenantThread *thread;
@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.thread = [[HPermenantThread alloc] init];
    [self.thread run];
}

- (IBAction)stopAction {
    [self.thread stop];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.thread executeTask:^{
        NSLog(@"执行任务");
    }];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
