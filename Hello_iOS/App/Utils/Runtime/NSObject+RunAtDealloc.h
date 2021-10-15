//
//  NSObject+RunAtDealloc.h
//  Hello_iOS
//
//  Created by Murph on 2021/10/14.
//

#import <Foundation/Foundation.h>
#import "BlockExecutor.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (RunAtDealloc)
-(void) runAtDealloc: (voidBlock)block;
@end

NS_ASSUME_NONNULL_END
