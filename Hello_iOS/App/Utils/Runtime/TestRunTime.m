//
//  TestRunTime.m
//  Hello_iOS
//
//  Created by Murph on 2021/10/14.
//

#import "TestRunTime.h"
#import <objc/runtime.h>

@implementation TestRunTime

- (void)getAllProperties {
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([TestRunTime class], &count);
    NSLog(@"%d", count);
    for(int i = 0; i< count; i++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        NSLog(@"Key: %@, Value: %@", key, value);
    }
    free(ivars);
}

- (void)getAllMethods {
    unsigned int count = 0;
    Method *methods = class_copyMethodList([TestRunTime class], &count);
    for(int i = 0; i< count; i++) {
        Method method = methods[i];
        SEL name = method_getName(method);
        NSString *nameStr = NSStringFromSelector(name);
        NSLog(@"method name: %@", nameStr);
    }
    free(methods);
}

@end
