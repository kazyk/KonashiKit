//
//  Created by TAKAHASHI kazuyuki on 2013/06/06.
//


#import <Foundation/Foundation.h>
#import "KNSIO.h"


@interface KNSPWMLEDOut : KNSIO

// ratio: 0-100
- (void)setDutyRatio:(int)ratio;

@end