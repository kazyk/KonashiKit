//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import <Foundation/Foundation.h>
#import "KNSDefines.h"


@interface KNSDigitalOut : NSObject

- (instancetype)initWithPin:(KNSPin)pin;

- (void)write:(KNSHighLow)val;

@end