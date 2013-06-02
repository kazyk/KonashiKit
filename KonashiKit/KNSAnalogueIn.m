//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import "KNSAnalogueIn.h"
#import "Konashi.h"


@interface KNSAnalogueIn()
@property (strong, nonatomic) NSMutableArray *listeners;
@property (weak, nonatomic) NSTimer *timer;
@end


@implementation KNSAnalogueIn

+ (int)analogueReference
{
    return KONASHI_ANALOG_REFERENCE;
}

- (instancetype)initWithPin:(KNSPin)pin requestInterval:(NSTimeInterval)interval
{
    self = [super initWithPin:pin];
    if (self) {
        _listeners = [[NSMutableArray alloc] init];
        [Konashi pinMode:pin mode:INPUT];

        NSString *notificationName =
                (pin == kKNSPin_AIO0) ? KONASHI_EVENT_UPDATE_ANALOG_VALUE_AIO0 :
                (pin == kKNSPin_AIO1) ? KONASHI_EVENT_UPDATE_ANALOG_VALUE_AIO1 :
                (pin == kKNSPin_AIO2) ? KONASHI_EVENT_UPDATE_ANALOG_VALUE_AIO2 : nil;
        if (notificationName == nil) {
            NSParameterAssert(NO);
            return nil;
        }
        [Konashi addObserver:self selector:@selector(updated) name:notificationName];

        _timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                  target:self
                                                selector:@selector(request:)
                                                userInfo:nil
                                                 repeats:YES];
    }
    return self;
}

- (KNSIO *)initWithPin:(KNSPin)pin
{
    NSAssert(NO, @"invalid initializer");
    return nil;
}

- (void)dealloc
{
    [Konashi removeObserver:self];
    [_timer invalidate];
}

- (void)addListener:(KNSAnalogueInListenerBlock)listener
{
    [self.listeners addObject:listener];
}

#pragma mark - private methods

- (void)updated
{
    int val = [Konashi analogRead:self.pin];
    for (KNSAnalogueInListenerBlock listener in self.listeners) {
        listener(val);
    }
}

- (void)request:(NSTimer *)timer
{
    [Konashi analogReadRequest:self.pin];
}

@end