//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import <Foundation/Foundation.h>
#import "KNSIO.h"


@interface KNSDigitalOut : KNSIO

- (void)write:(KNSHighLow)val;

@end