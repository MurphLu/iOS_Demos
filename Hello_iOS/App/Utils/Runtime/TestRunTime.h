//
//  TestRunTime.h
//  Hello_iOS
//
//  Created by Murph on 2021/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestRunTime : NSObject

@property(nonatomic, assign) int num;
@property(nonatomic, strong) NSString *str;
@property(nonatomic, strong) NSDictionary *map;

-(void) getAllProperties;
- (void)getAllMethods;
@end

NS_ASSUME_NONNULL_END
