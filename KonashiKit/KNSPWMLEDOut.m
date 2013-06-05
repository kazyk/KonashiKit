//
//  Created by TAKAHASHI kazuyuki on 2013/06/06.
//


#import "KNSPWMLEDOut.h"
#import "Konashi.h"


@implementation KNSPWMLEDOut

- (KNSIO *)initWithPin:(KNSPin)pin
{
    self = [super initWithPin:pin];
    if (self) {
        [Konashi pinMode:pin mode:OUTPUT];
        [Konashi pwmMode:pin mode:KONASHI_PWM_ENABLE_LED_MODE];
    }

    return self;
}


- (void)setDutyRatio:(int)ratio
{
    [Konashi pwmLedDrive:self.pin dutyRatio:ratio];
}

@end