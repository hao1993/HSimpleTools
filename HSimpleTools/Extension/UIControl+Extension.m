//
//  UIControl+Extension.m
//  HSimpleTools
//
//  Created by 杨世浩 on 2019/1/19.
//  Copyright © 2019 hao. All rights reserved.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>

@implementation UIControl (Extension)

+ (void)load {
    Method method1 = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method method2 = class_getInstanceMethod(self, @selector(h_sendAction:to:forEvent:));
    method_exchangeImplementations(method1, method2);
}

- (void)h_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([self isKindOfClass:[UIButton class]]) { // 拦截了所有按钮的实现
//        NSLog(@"%@-%@-%@", self, target, event);
    }

    // 调用系统原来的实现
    [self h_sendAction:action to:target forEvent:event];
}

@end
