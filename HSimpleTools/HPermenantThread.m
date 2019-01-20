//
//  HPermenantThread.m
//  HSimpleTools
//
//  Created by 杨世浩 on 2019/1/20.
//  Copyright © 2019 hao. All rights reserved.
//

#import "HPermenantThread.h"

/** MJThread **/
@interface HThread : NSThread
@end
@implementation HThread
- (void)dealloc {
    NSLog(@"%s", __func__);
}
@end

/** HPermenantThread **/
@interface HPermenantThread()
@property (strong, nonatomic) HThread *innerThread;
@property (assign, nonatomic, getter=isStopped) BOOL stopped;
@end

@implementation HPermenantThread

#pragma mark - public methods

- (instancetype)init {
    if (self = [super init]) {
        self.stopped = NO;

        __weak typeof(self) weakSelf = self;

        self.innerThread = [[HThread alloc] initWithBlock:^{
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];

            while (weakSelf && !weakSelf.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
        }];
    }
    return self;
}

- (void)run {
    if (!self.innerThread) return;

    [self.innerThread start];
}

- (void)executeTask:(HPermenantThreadTask)task {
    if (!self.innerThread || !task) return;

    [self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

- (void)stop {
    if (!self.innerThread) return;

    [self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}

- (void)dealloc {
    NSLog(@"%s", __func__);

    [self stop];
}

#pragma mark - private methods
- (void)__stop {
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

- (void)__executeTask:(HPermenantThreadTask)task {
    task();
}

@end
