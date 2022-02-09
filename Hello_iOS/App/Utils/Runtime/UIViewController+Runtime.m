//
//  UIViewController+UIViewController_Swizzle.m
//  Hello_iOS
//
//  Created by Murph on 2021/10/14.
//

#import "UIViewController+Runtime.h"
#import <objc/runtime.h>

@interface ResloveMethodForwarding : NSObject
- (void) trackEventForViewDidLoad3: (NSDictionary *) params;
- (void) trackEventForViewDidLoad4: (NSDictionary *) params;

@end

@implementation ResloveMethodForwarding
- (void) trackEventForViewDidLoad3: (NSDictionary *) params {
    NSLog(@"%@ 实现了 trackEventForViewDidLoad3: 方法的转发", [self class]);
}

- (void) trackEventForViewDidLoad4: (NSDictionary *) params {
    NSLog(@"%@ 通过 trackEventForViewDidLoad4: 方法处理了转发", [self class]);
}
@end

@implementation UIViewController (Runtime)
+ (void)load {
    // 通过 method_exchangeImplementations 来交换两个方法的实现
//    Method viewDidLoad = class_getInstanceMethod([UIViewController self], @selector(viewDidLoad));
//    Method viewDidLoadNew = class_getInstanceMethod([UIViewController self], @selector(viewDidLoadNew));
//    method_exchangeImplementations(viewDidLoad, viewDidLoadNew);
}

- (void)viewDidLoadNew {
    [self viewDidLoadNew];
    NSLog(@"%@", [self class]);
    [self trackEventForViewDidLoad1: NSDictionary.dictionary];
    [self trackEventForViewDidLoad2: NSDictionary.dictionary];
    [self trackEventForViewDidLoad3: NSDictionary.dictionary];
    [self trackEventForViewDidLoad4: NSDictionary.dictionary];
    [self trackEventForViewDidLoad5: NSDictionary.dictionary];
}

// 提供方法实现
- (void) trackEventForViewDidLoad1:(NSDictionary *)params {
    NSLog(@"默认提供方法实现");
}

// 动态对象方法决议，动态提供对应方法实现并返回 YES，
// 或者返回 NO，继续向下转发
+ (BOOL) resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(trackEventForViewDidLoad2:)) {
        class_addMethod(self, sel, (IMP) trackEventForViewDidLoadImpl, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

// 返回对象：将上一步未能处理调的消息转发给其他类对象处理
// 返回nil: 则继续
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(trackEventForViewDidLoad3:)) {
        return [ResloveMethodForwarding new];
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *sig;
    sig = [[ResloveMethodForwarding new] methodSignatureForSelector:@selector(trackEventForViewDidLoad4:)];
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([[ResloveMethodForwarding new] respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:[ResloveMethodForwarding new]];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"%@ 无法正常处理 %@ 方法", [self class], NSStringFromSelector(aSelector));
}

void trackEventForViewDidLoadImpl(id self, SEL cmd, id Num) {
    NSLog(@"%@的%@方法动态实现了，参数为%@", [self class], NSStringFromSelector(cmd), Num);
}

@end
