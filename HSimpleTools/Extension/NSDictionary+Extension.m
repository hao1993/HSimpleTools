//
//  NSDictionary+Extension.m
//  HSimpleTools
//
//  Created by 杨世浩 on 2019/1/19.
//  Copyright © 2019 hao. All rights reserved.
//

#import "NSDictionary+Extension.h"
#import <objc/runtime.h>

@implementation NSDictionary (Extension)

+ (void)load {
    Class cls = NSClassFromString(@"__NSPlaceholderDictionary");
    Method method1 = class_getInstanceMethod(cls, @selector(initWithObjects:forKeys:count:));
    Method method2 = class_getInstanceMethod(cls, @selector(h_initWithObjects:forKeys:count:));
    method_exchangeImplementations(method1, method2);
}

- (instancetype)h_initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt {

    return [self h_initWithObjects:objects forKeys:keys count:cnt];
}

@end
