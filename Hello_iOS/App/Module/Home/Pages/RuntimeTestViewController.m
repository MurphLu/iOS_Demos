//
//  RuntimeTestViewController.m
//  Hello_iOS
//
//  Created by Murph on 2021/10/14.
//

#import "RuntimeTestViewController.h"
#import "TestRunTime.h"

@interface RuntimeTestViewController ()

@end

@implementation RuntimeTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TestRunTime * test = [[TestRunTime alloc] init];
    [test getAllProperties];
    [test getAllMethods];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
