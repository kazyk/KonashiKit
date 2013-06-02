//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import "KNSIO.h"

@implementation KNSIO

- (instancetype)initWithPin:(KNSPin)pin
{
    self = [super init];
    if (self) {
        _pin = pin;
    }
    return self;
}

- (id)init
{
    NSAssert(NO, @"invalid initializer");
    return nil;
}

@end