//
//  BlocExexutor.m
//  Hello_iOS
//
//  Created by Murph on 2021/10/14.
//

#import "BlockExecutor.h"

@interface BlockExecutor () {
    voidBlock _block;
}
@end

@implementation BlockExecutor
- (id)initWithBlock:(voidBlock)aBlock
{
   self = [super init];
   
   if (self) {
       _block = [aBlock copy];
   }
   return self;
}

- (void)dealloc
{
   _block ? _block() : nil;
}
@end
