//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import "KNSDigitalIn.h"
#import "Konashi.h"


@interface KNSDigitalIn()
@property (strong, nonatomic) NSMutableArray *listeners;
@end


@implementation KNSDigitalIn

- (KNSIO *)initWithPin:(KNSPin)pin
{
    self = [super initWithPin:pin];
    if (self) {
        [Konashi pinMode:pin mode:INPUT];
        _value = (KNSHighLow)[Konashi digitalRead:pin];
        _listeners = [[NSMutableArray alloc] init];
        [Konashi addObserver:self selector:@selector(updated) name:KONASHI_EVENT_UPDATE_PIO_INPUT];
    }
    return self;
}

- (void)dealloc
{
    [Konashi removeObserver:self];
}

- (void)addListener:(KNSDigitalInListenerBlock)listener
{
    [self.listeners addObject:[listener copy]];
}

#pragma mark - private methods

- (void)updated
{
    KNSHighLow val = (KNSHighLow)[Konashi digitalRead:self.pin];
    if (self.value != val) {
        _value = val;
        for (KNSDigitalInListenerBlock listener in self.listeners) {
            listener(val);
        }
    }
}

@end