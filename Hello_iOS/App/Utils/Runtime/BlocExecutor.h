//
//  BlocExexutor.h
//  Hello_iOS
//
//  Created by Murph on 2021/10/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^voidBlock)(void);
@interface BlocExecutor : NSObject
-(id)initWithBlock:(voidBlock)block;
@end

NS_ASSUME_NONNULL_END
