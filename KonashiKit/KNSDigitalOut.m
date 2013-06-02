//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import "KNSDigitalOut.h"
#import "Konashi.h"


@interface KNSDigitalOut()
@property (readonly, nonatomic) KNSPin pin;
@end

@implementation KNSDigitalOut

- (instancetype)initWithPin:(KNSPin)pin
{
    self = [super init];
    if (self) {
        _pin = pin;
        [Konashi pinMode:pin mode:OUTPUT];
    }
    return self;
}

- (id)init
{
    NSAssert(NO, @"invalid initializer");
    return nil;
}

- (void)write:(KNSHighLow)val
{
    [Konashi digitalWrite:self.pin value:val];
}

@end