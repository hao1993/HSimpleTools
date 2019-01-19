//
//  NSMutableDictionary+Extension.m
//  HSimpleTools
//
//  Created by 杨世浩 on 2019/1/19.
//  Copyright © 2019 hao. All rights reserved.
//

#import "NSMutableDictionary+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Extension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"__NSDictionaryM");
        Method method1 = class_getInstanceMethod(cls, @selector(setObject:forKeyedSubscript:));
        Method method2 = class_getInstanceMethod(cls, @selector(h_setObject:forKeyedSubscript:));
        method_exchangeImplementations(method1, method2);

        Class cls2 = NSClassFromString(@"__NSDictionaryI");
        Method method3 = class_getInstanceMethod(cls2, @selector(objectForKeyedSubscript:));
        Method method4 = class_getInstanceMethod(cls2, @selector(h_objectForKeyedSubscript:));
        method_exchangeImplementations(method3, method4);
    });
}

- (void)h_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    if (key == nil) return;
    [self h_setObject:obj forKeyedSubscript:key];
}

- (id)h_objectForKeyedSubscript:(id)key {
    if (key == nil) return nil;
    return [self h_objectForKeyedSubscript:key];
}

// hook [UIFont systemFontOfSize:14 * 1.1];

@end
