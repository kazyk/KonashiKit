//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import <Foundation/Foundation.h>
#import "KNSDefines.h"

//abstract
@interface KNSIO : NSObject

@property (readonly, nonatomic) KNSPin pin;

//designated initializer.
- (instancetype)initWithPin:(KNSPin)pin;

@end