//
//  HPermenantThread.h
//  HSimpleTools
//
//  Created by 杨世浩 on 2019/1/20.
//  Copyright © 2019 hao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^HPermenantThreadTask)(void);

@interface HPermenantThread : NSObject

/**
 开启线程
 */
- (void)run;

/**
 在当前子线程执行一个任务
 */
- (void)executeTask:(HPermenantThreadTask)task;

/**
 结束线程
 */
- (void)stop;

@end

NS_ASSUME_NONNULL_END
