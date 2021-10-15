//
//  NSObject+RunAtDealloc.m
//  Hello_iOS
//
//  Created by Murph on 2021/10/14.
//
#import <objc/runtime.h>

#import "NSObject+RunAtDealloc.h"

@implementation NSObject (RunAtDealloc)
const void *runAtDeallocBlockKey = &runAtDeallocBlockKey;

- (void)runAtDealloc:(voidBlock)block {
    if(block) {
        BlockExecutor *executor = [[BlockExecutor alloc] initWithBlock:block];
        objc_setAssociatedObject(self, runAtDeallocBlockKey, executor, OBJC_ASSOCIATION_RETAIN);
    }
}
@end
