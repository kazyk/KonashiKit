//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import "KNSDigitalOut.h"
#import "Konashi.h"


@implementation KNSDigitalOut

- (KNSIO *)initWithPin:(KNSPin)pin
{
    self = [super initWithPin:pin];
    if (self) {
        [Konashi pinMode:pin mode:OUTPUT];
    }
    return self;
}

- (void)write:(KNSHighLow)val
{
    [Konashi digitalWrite:self.pin value:val];
}

@end