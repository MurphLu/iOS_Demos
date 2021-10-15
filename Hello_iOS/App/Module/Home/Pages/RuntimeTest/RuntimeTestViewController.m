//
//  RuntimeTestViewController.m
//  Hello_iOS
//
//  Created by Murph on 2021/10/14.
//

#import "RuntimeTestViewController.h"
#import "TestRunTime.h"

@interface RuntimeTestViewController () {
    TestRunTime *runtime;
}

@end

@implementation RuntimeTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    runtime = [[TestRunTime alloc] init];
    [runtime getAllProperties];
    [runtime getAllMethods];
    runtime.name = @"aaa";
    NSLog(@"%@", runtime.name);
    @autoreleasepool {
        TestObj *str = [[TestObj alloc] init];
        runtime.desc1 = str;
        runtime.desc = str;
        NSLog(@"%@", runtime.desc);
        NSLog(@"%@", runtime.desc1);
    }
    
    NSLog(@"%@", runtime.desc);
    NSLog(@"%@", runtime.desc1);
}
- (IBAction)test_print:(UIButton *)sender {
    NSLog(@"%@", runtime.desc);
    NSLog(@"%@", runtime.desc1);
}

@end
