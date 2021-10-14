//
//  MethodSwizzleTestViewController.m
//  Hello_iOS
//
//  Created by Murph on 2021/10/13.
//

#import "MethodSwizzleTestViewController.h"
#import <objc/runtime.h>

@interface MethodSwizzleTestViewController ()

@end

@implementation MethodSwizzleTestViewController

+ (void)load {
    Method viewDidAppear = class_getInstanceMethod([MethodSwizzleTestViewController class], @selector(viewDidAppear:));
    Method newViewDidAppear = class_getInstanceMethod([MethodSwizzleTestViewController class], @selector(viewDidAppearNew:));
    
    method_exchangeImplementations(viewDidAppear, newViewDidAppear);
}

- (void)viewDidAppear:(BOOL)animated {
    [self viewDidAppear:animated];
}

- (void)viewDidAppearNew: (BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"aaaaa");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.brownColor];
}

@end
