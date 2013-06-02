//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import "KNS.h"
#import "Konashi.h"

static NSString *const kLastPeripheralNameKey = @"KNSLastPeripheralName";


@interface KNS()
@property (copy, nonatomic) void (^readyBlock)();
@end

@implementation KNS

+ (instancetype)sharedInstance
{
    static KNS *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
        [instance initialize];
    });
    return instance;
}

- (void)find:(void (^)())completionBlock
{
    self.readyBlock = completionBlock;

    NSString *name = self.peripheralName ?: [[NSUserDefaults standardUserDefaults] stringForKey:kLastPeripheralNameKey];
    if (self.usesLastPeripheralName && name) {
        [Konashi findWithName:name];
    } else {
        [Konashi find];
    }
}

#pragma mark - private methods

- (void)initialize
{
    self.usesLastPeripheralName = YES;
    [Konashi initialize];
    [Konashi addObserver:self selector:@selector(konashiIsReady) name:KONASHI_EVENT_READY];
    [Konashi addObserver:self selector:@selector(konashiNotFound) name:KONASHI_EVENT_PERIPHERAL_NOT_FOUND];
}

- (void)konashiIsReady
{
    NSLog(@"KONASHI_EVENT_READY");
    NSLog(@"[Konashi peripheralName] = %@", [Konashi peripheralName]);
    self.peripheralName = [Konashi peripheralName];
    [[NSUserDefaults standardUserDefaults] setObject:self.peripheralName forKey:kLastPeripheralNameKey];
    if (self.readyBlock) {
        self.readyBlock();
    }
}

- (void)konashiNotFound
{
    NSLog(@"KONASHI_EVENT_PERIPHERAL_NOT_FOUND");
    self.peripheralName = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kLastPeripheralNameKey];
    [Konashi find];
}

@end