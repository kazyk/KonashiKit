//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import <Foundation/Foundation.h>
#import "KNSIO.h"

typedef void (^KNSAnalogueInListenerBlock)(int value);


@interface KNSAnalogueIn : KNSIO

+ (int)analogueReference;

//designated initializer
- (instancetype)initWithPin:(KNSPin)pin requestInterval:(NSTimeInterval)interval;

- (void)addListener:(KNSAnalogueInListenerBlock)listener;

@end