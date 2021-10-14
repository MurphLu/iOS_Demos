//
//  UIViewController+UIViewController_Swizzle.h
//  Hello_iOS
//
//  Created by Murph on 2021/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Runtime)
- (void) trackEventForViewDidLoad1: (NSDictionary *) params;
- (void) trackEventForViewDidLoad2: (NSDictionary *) params;
- (void) trackEventForViewDidLoad3: (NSDictionary *) params;
- (void) trackEventForViewDidLoad4: (NSDictionary *) params;
- (void) trackEventForViewDidLoad5: (NSDictionary *) params;
@end

NS_ASSUME_NONNULL_END
