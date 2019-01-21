//
//  NSArray+Extension.m
//  HSimpleTools
//
//  Created by hao on 2019/1/21.
//  Copyright © 2019 hao. All rights reserved.
//

#import "NSArray+Extension.h"
#import <objc/runtime.h>

@implementation NSArray (Extension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"__NSArrayI");
        Method method1 = class_getInstanceMethod(cls, @selector(objectAtIndexedSubscript:));
        Method method2 = class_getInstanceMethod(cls, @selector(h_objectAtIndexedSubscript:));
        method_exchangeImplementations(method1, method2);
        
    });
}

- (id)h_objectAtIndexedSubscript:(NSUInteger)idx {
    if (idx > self.count) return @"";
    
    return [self h_objectAtIndexedSubscript:idx];
}

@end
