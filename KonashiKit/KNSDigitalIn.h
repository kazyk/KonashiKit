//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import <Foundation/Foundation.h>
#import "KNSIO.h"

typedef void (^KNSDigitalInListenerBlock)(KNSHighLow value);


@interface KNSDigitalIn : KNSIO

@property (assign, readonly, nonatomic) KNSHighLow value;

- (void)addListener:(KNSDigitalInListenerBlock)listener;

@end