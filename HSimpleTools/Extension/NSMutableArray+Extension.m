//
//  NSMutableArray+Extension.m
//  HSimpleTools
//
//  Created by 杨世浩 on 2019/1/19.
//  Copyright © 2019 hao. All rights reserved.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Extension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{   // 防止调用两次，一般来说只会调用一次，防止别人手动调用 [NSMutableArray load];
        // 类簇：NSString、NSArray、NSDictionary，真实类型是其他类型
        Class cls = NSClassFromString(@"__NSArrayM");
        Method method1 = class_getInstanceMethod(cls, @selector(insertObject:atIndex:));
        Method method2 = class_getInstanceMethod(cls, @selector(h_insertObject:atIndex:));
        method_exchangeImplementations(method1, method2);
        
        Method method3 = class_getInstanceMethod(cls, @selector(objectAtIndexedSubscript:));
        Method method4 = class_getInstanceMethod(cls, @selector(h_objectAtIndexedSubscript:));
        method_exchangeImplementations(method3, method4);
        
    });
}

- (void)h_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) return;

    [self h_insertObject:anObject atIndex:index];
}

- (id)h_objectAtIndexedSubscript:(NSUInteger)idx {
    if (idx > self.count) return @"";
    
    return [self h_objectAtIndexedSubscript:idx];
}

@end
